package src.mp3;

import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.servlet.http.HttpSession;
import javax.transaction.UserTransaction;

/**
 * <p>A simple managed bean to mediate between the user and the persistence
 * layer.</p>
 *
 * @author rlubke
 */
public class UserManager {
   

    /**
     * <p>The key for the session scoped attribute holding the appropriate
     * <code>Wuser</code> instance.</p>
     */
    public static final String USER_SESSION_KEY = "user";
    public static final String ADMIN_SESSION_KEY = "admin";
    /**
     * <p>The
     * <code>PersistenceContext</code>.</p>
     */
    @PersistenceContext
    private EntityManager em;
    /**
     * <p>The transaction resource.</p>
     */
    @Resource
    private UserTransaction utx;
    private String username;
    private String password;
    private String passwordv;
    private String fname;
    private String lname;
    private String contact;
    private String employer;
    private String care_provider;
    private String image;
    private String emer_info;
    private String history;
    private Integer ins_id;
    private Wuser wuser;

    public Integer getIns_id() {
        return ins_id;
    }

    public void setIns_id(Integer ins_id) {
        this.ins_id = ins_id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPasswordv() {
        return passwordv;
    }

    public void setPasswordv(String passwordv) {
        this.passwordv = passwordv;
    }

    public String getFname() {
        return fname;
    }

    public void setFname(String fname) {
        this.fname = fname;
    }

    public String getLname() {
        return lname;
    }

    public void setLname(String lname) {
        this.lname = lname;
    }

    public String getContact() {
        return contact;
    }

    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getEmployer() {
        return employer;
    }

    public void setEmployer(String employer) {
        this.employer = employer;
    }

    public String getCare_provider() {
        return care_provider;
    }

    public void setCare_provider(String care_provider) {
        this.care_provider = care_provider;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getEmer_info() {
        return emer_info;
    }

    public void setEmer_info(String emer_info) {
        this.emer_info = emer_info;
    }

    public String getHistory() {
        return history;
    }

    public void setHistory(String history) {
        this.history = history;
    }

    //----------------------- Public Methods-----------------------------------//
    /**
     * <p>Validates the user. If the user doesn't exist or the password is
     * incorrect, the appropriate message is added to the current
     * <code>FacesContext</code>. If the user successfully authenticates,
     * navigate them to the page referenced by the outcome
     * <code>app-main</code>. </p>
     *
     * @return <code>app-main</code> if the user authenticates, otherwise
     * returns <code>null</code>
     */
    public String validateUser() {
        FacesContext context = FacesContext.getCurrentInstance();
        Wuser user = getUser();
        if (user != null) {
            if (!user.getPassword().equals(password)) {
                FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_ERROR,
                        "Login Failed!",
                        "The password specified is not correct.");
                context.addMessage(null, message);
                return null;
            }
            
            HttpSession session = (HttpSession) FacesContext.getCurrentInstance().getExternalContext().getSession(false);
            session.setAttribute(USER_SESSION_KEY, user);
            
            if (user.getUsername().equalsIgnoreCase("admin")) {

                context.getExternalContext().getSessionMap().put(USER_SESSION_KEY, user);
                return "app-admin";
            } else {
                context.getExternalContext().getSessionMap().put(USER_SESSION_KEY, user);
                return "app-main";
            }
            
        } else {
            FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_ERROR,
                    "Login Failed!",
                    "Username '"
                    + username
                    + "' does not exist.");
            context.addMessage(null, message);
            return null;
        }
    }

    public void init() {
        FacesContext context = FacesContext.getCurrentInstance();
        Wuser wuser = new Wuser();
        wuser.setFirstname("abc");
        wuser.setLastname("xyz");
        wuser.setPassword("abc");
        wuser.setUsername("abc");
        wuser.setSince(new Date());
        wuser.setContact("chicago");
        wuser.setEmployer("pepsi");
        wuser.setCare_provider("pqr");
        wuser.setImage("C:/");
        wuser.setEmer_info("67899");
        wuser.setHistory("1. Cough 2. cold");
        wuser.setIns_id(7678);
        try {
            utx.begin();
            em.persist(wuser);
            utx.commit();
        }catch(Exception e){
            FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_ERROR,
                        "Error creating user!",
                        "Unexpected error when creating your account.  Please contact the system Administrator");
                context.addMessage(null, message);
                Logger.getAnonymousLogger().log(Level.SEVERE,"Unable to Initialize sample user",e);
        }

    }
    
    

    /**
     * <p>Creates a new
     * <code>Wuser</code>. If the specified user name exists or an error occurs
     * when persisting the Wuser instance, enqueue a message detailing the
     * problem to the
     * <code>FacesContext</code>. If the user is created, move the user back to
     * the login view.</p>
     *
     * @return <code>login</code> if the user is created, otherwise *
     * returns <code>null</code>
     */
    public String createUser() {
        FacesContext context = FacesContext.getCurrentInstance();
        wuser = getUser();
        if (wuser == null) {
            if (!password.equals(passwordv)) {
                FacesMessage message = new FacesMessage("The specified passwords do not match.  Please try again");
                context.addMessage(null, message);
                return null;
            }
            wuser = new Wuser();
            wuser.setFirstname(fname);
            wuser.setLastname(lname);
            wuser.setPassword(password);
            wuser.setUsername(username);
            wuser.setSince(new Date());
            wuser.setContact(contact);
            wuser.setEmployer(employer);
            wuser.setCare_provider(care_provider);
            wuser.setImage(image);
            wuser.setEmer_info(emer_info);
            wuser.setHistory(history);
            wuser.setIns_id(ins_id);
            try {
                utx.begin();
                em.persist(wuser);
                utx.commit();
                return "login";
            } catch (Exception e) {
                FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_ERROR,
                        "Error creating user!", "Unexpected error when creating your account.  Please contact the system Administrator");
                context.addMessage(null, message);
                Logger.getAnonymousLogger().log(Level.SEVERE, "Unable to create new user", e);
                return null;
            }
        } else {
            FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_ERROR,
                    "Username '"
                    + username
                    + "' already exists!  ",
                    "Please choose a different username.");
            context.addMessage(null, message);
            return null;
        }
    }
    
    public String updateUser() {
        FacesContext context = FacesContext.getCurrentInstance();
        wuser = getUser();
        if (wuser == null) {
            wuser = new Wuser();
            wuser.setFirstname(fname);
            wuser.setLastname(lname);
            wuser.setPassword(password);
            wuser.setUsername(username);
            wuser.setSince(new Date());
            wuser.setContact(contact);
            wuser.setEmployer(employer);
            wuser.setCare_provider(care_provider);
            wuser.setImage(image);
            wuser.setEmer_info(emer_info);
            wuser.setHistory(history);
            wuser.setIns_id(ins_id);
            try {
                utx.begin();
                em.persist(wuser);
                utx.commit();
                return "login";
            } catch (Exception e) {
                FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_ERROR,
                        "Error creating user!", "Unexpected error when creating your account.  Please contact the system Administrator");
                context.addMessage(null, message);
                Logger.getAnonymousLogger().log(Level.SEVERE, "Unable to create new user", e);
                return null;
            }
        } else {
            FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_ERROR,
                    "Username '"
                    + username
                    + "' already exists!  ",
                    "Please choose a different username.");
            context.addMessage(null, message);
            return null;
        }
    }

    /**
     * <p>When invoked, it will invalidate the user's session and move them to
     * the login view.</p>
     *
     * @return <code>login</code>
     */
    public String logout() {
        HttpSession session = (HttpSession) FacesContext.getCurrentInstance().getExternalContext().getSession(false);
        if (session != null) {
            session.invalidate();
        }
        return "login";

    }

    // --------------------------------------------------------- Private Methods
    /**
     * <p>This will attempt to lookup a
     * <code>Wuser</code> object based on the provided user name.</p>
     *
     * @return a <code>Wuser</code> object associated with the current username,
     * otherwise, if no <code>Wuser</code> can be found, *
     * returns <code>null</code>
     */
    private Wuser getUser() {
        try {
            Wuser user = (Wuser) em.createNamedQuery("Wuser.findByUsername").
                    setParameter("username", username).getSingleResult();
            return user;
        } catch (NoResultException nre) {
            return null;
        }
    }
    
    public List<Wuser> findall(){
        try {
            TypedQuery<Wuser> query = em.createNamedQuery("Wuser.findAll",Wuser.class);
            return query.getResultList();
        } catch (NoResultException nre) {
            return null;
        }
    }
    
    public List<Wuser> findByX(){
        try {
            HttpSession session = (HttpSession) FacesContext.getCurrentInstance().getExternalContext().getSession(false);
            Wuser usr = (Wuser) session.getAttribute(USER_SESSION_KEY);
            String name = usr.getUsername();
            //session.setAttribute(USER_SESSION_KEY, user);
            
            TypedQuery<Wuser> query = em.createNamedQuery("Wuser.findByUsername",Wuser.class);
            System.out.println("==>u name is : "+name);
            query.setParameter("username",name);
            List<Wuser> temp = query.getResultList();
            if(temp!=null){
                
            }
            return temp;
        } catch (NoResultException nre) {
            return null;
        }
    }
}
