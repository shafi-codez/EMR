
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <link rel="stylesheet" type="text/css" href="jsfcrud.css" />
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Account</title>
    </head>
    
    <body>

    <h1>Create a New Account</h1>
    
    <f:view>
        <h:form id="create" styleClass="jsfcrud_list_form">            
            <h:panelGrid columns="3" border="0">
                First Name: <h:inputText id="fname"       
                                         requiredMessage="*"
                                         value="#{usermanager.fname}"
                                         required="true"/>  
                            <h:message for="create:fname" style="color: red"/>
                Last Name: <h:inputText id="lname"  
                                        requiredMessage="*"
                                        value="#{usermanager.lname}"
                                        required="true"/>
                           <h:message for="create:lname" style="color: red"/>
                Username: <h:inputText id="username" 
                                       requiredMessage="*"
                                       value="#{usermanager.username}"
                                       required="true"/>
                          <h:message for="create:username" style="color: red"/>
                Password: <h:inputSecret id="password"    
                                         requiredMessage="*"
                                         value="#{usermanager.password}"
                                         required="true"/>
                          <h:message for="create:password" style="color: red"/>
                Password (verify): <h:inputSecret id="passwordv"   
                                                  requiredMessage="*"
                                                  value="#{usermanager.passwordv}"
                                                  required="true"/>
                                   <h:message for="create:passwordv" style="color: red"/>
                Contact Info: <h:inputText id="cinfo"       
                                         requiredMessage="*"
                                         value="#{usermanager.contact}"
                                         required="false"/>  
                            <h:message for="create:cinfo" style="color: red"/>
                Current or Prev Employer: <h:inputText id="emplyr"       
                                         requiredMessage="*"
                                         value="#{usermanager.employer}"
                                         required="false"/>  
                            <h:message for="create:emplyr" style="color: red"/>  
                            
                Care Provider: <h:inputText id="provider"       
                                         requiredMessage="*"
                                         value="#{usermanager.care_provider}"
                                         required="false"/>  
                            <h:message for="create:provider" style="color: red"/> 
                Patient Image: <h:inputText id="image"       
                                         requiredMessage="*"
                                         value="#{usermanager.image}"
                                         required="false"/>  
                            <h:message for="create:image" style="color: red"/>
                Emergency Info: <h:inputText id="einfo"       
                                         requiredMessage="*"
                                         value="#{usermanager.emer_info}"
                                         required="false"/>  
                            <h:message for="create:einfo" style="color: red"/>
                Patient History: <h:inputText id="pHist"       
                                         requiredMessage="*"
                                         value="#{usermanager.history}"
                                         required="false"/>  
                            <h:message for="create:pHist" style="color: red"/>
                Insurance ID: <h:inputText id="InsID"       
                                         requiredMessage="*"
                                         value="#{usermanager.ins_id}"
                                         required="false"/>  
                            <h:message for="create:InsID" style="color: red"/>
            </h:panelGrid>
                
            <h:commandButton id="submit" 
                             value="Create"
                             action="#{usermanager.createUser()}"/>
            <h:messages style="color: red" globalOnly="true"/>
        </h:form>
    </f:view>
    
    </body>
</html>
