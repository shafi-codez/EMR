

<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        
        <link href="jsfcrud.css" rel="stylesheet" type="text/css" media="screen" />
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Electronic Management Record</title>
    </head>
    <body>
        <f:view>
            <h:form id="update" styleClass="jsfcrud_list_form">
                <h1> Welcome ${user.firstname} ${user.lastname}! </h1>
                <h:outputText value="you can now update your record & save" />
                <h:dataTable value="#{usermanager.findByX()}" var="pts" border="1">
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="ID"/>
                    </f:facet>
                    <h:outputText value="#{pts.id}"/>
                </h:column>

                <h:column>
                    <f:facet name="header">
                        <h:outputText value="First Name"/>
                        <h:outputText value="#{pts.firstname}"/>
                    </f:facet>
                    
                </h:column>

                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Last Name"/>
                        <h:outputText value="#{pts.lastname}"/>
                    </f:facet>
                    
                </h:column>
                
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="First Name"/>
                    </f:facet>
                    <h:outputText value="#{pts.password}"/>
                </h:column>
                
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Contact Info"/>
                    </f:facet>
                    <h:outputText value="#{pts.contact}"/>
                </h:column>
                
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Employer"/>
                    </f:facet>
                    <h:outputText value="#{pts.employer}"/>
                </h:column>
                
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Care Provider"/>
                    </f:facet>
                    <h:outputText value="#{pts.care_provider}"/>
                </h:column>
                
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Emergency Info"/>
                    </f:facet>
                    <h:outputText value="#{pts.emer_info}"/>
                </h:column>
                
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Image"/>
                    </f:facet>
                   
                    <h:graphicImage value="#{pts.image}" />
                </h:column>
                
            </h:dataTable>
                <br>
                <h:panelGrid columns="2">

                    
                First Name: <h:inputText id="fname"       
                                         requiredMessage="*"
                                         value="#{usermanager.fname}"
                                         required="true"/>  
                            
                            
                Last Name: <h:inputText id="lname"  
                                        requiredMessage="*"
                                        value="#{usermanager.lname}"
                                        required="true"/>
                           
                
                                   
                Contact Info: <h:inputText id="cinfo"       
                                         requiredMessage="*"
                                         value="#{usermanager.contact}"
                                         required="false"/>  
                            
                            
                Current or Prev Employer: <h:inputText id="emplyr"       
                                         requiredMessage="*"
                                         value="#{usermanager.employer}"
                                         required="false"/>  
                                                       
                Care Provider: <h:inputText id="provider"       
                                         requiredMessage="*"
                                         value="#{usermanager.care_provider}"
                                         required="false"/>  
                            
                 
                            
                Emergency Info: <h:inputText id="einfo"       
                                         requiredMessage="*"
                                         value="#{usermanager.emer_info}"
                                         required="false"/>  
                            
                            
                Patient History: <h:inputText id="pHist"       
                                         requiredMessage="*"
                                         value="#{usermanager.history}"
                                         required="false"/>  
                            
                            
                Insurance ID: <h:inputText id="InsID"       
                                         requiredMessage="*"
                                         value="#{usermanager.ins_id}"
                                         required="false"/>  
                            
            
                </h:panelGrid>
                <h:commandButton id="logout" value="Logout" action="#{usermanager.logout}"/>

                <h:commandButton id="save" 
                                 value="save"
                                 action="#{usermanager.createUser()}"/>
            </h:form>
        </f:view>
    </body>
</html>
