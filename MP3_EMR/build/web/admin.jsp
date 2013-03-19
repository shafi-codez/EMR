

<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>

<%@taglib prefix="f" uri="http://java.sun.com/jsf/core"%>
<%@taglib prefix="h" uri="http://java.sun.com/jsf/html"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <link href="jsfcrud.css" rel="stylesheet" type="text/css" media="screen" />
        <title>Electronic Management Record</title>
    </head>
    <body>
        <f:view>
            <h1><h:outputText value="ADMIN PAGE" /></h1>
            Hello Admin, Welcome ${user.firstname} ${user.lastname}!  Registered admin since ${user.since}.
            
            <h1>List of the Patients details  :</h1>
            <hr/>
            <h:dataTable value="#{usermanager.findall()}" var="pts" border="1">
                <h:column>
                    <f:facet name="header">
                        <h:outputText value="ID"/>
                    </f:facet>
                    <h:outputText value="#{pts.id}"/>
                </h:column>

                <h:column>
                    <f:facet name="header">
                        <h:outputText value="First Name"/>
                    </f:facet>
                    <h:outputText value="#{pts.firstname}"/>
                </h:column>

                <h:column>
                    <f:facet name="header">
                        <h:outputText value="Last Name"/>
                    </f:facet>
                    <h:outputText value="#{pts.lastname}"/>
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
                
            </h:dataTable>
            <hr/>


            <h:form>
                <h:commandButton id="logout" value="Logout" action="#{usermanager.logout}"/>
                <h:commandButton id="EditBYid" value="EditByID" action="#{usermanager.logout}"/>
                <h:commandButton id="DeleteALL" value="DeleteALL" action="#{usermanager.logout}"/>
            </h:form>
        </f:view>
    </body>
</html>
