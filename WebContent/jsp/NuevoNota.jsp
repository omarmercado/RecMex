<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>RecPolitica : Nueva Nota</title>
<link href="theme/style.css" rel="stylesheet" type="text/css" />
</head>
<body>

<div id="container">
<div id="top"><h1>     <span style="color:#259FDA; font-size:14pt;">RecPolitica.com</span></h1></div>

<div id="navcontainer">
<div id="topnav">
		<ul>
		<li><a href="Portada.htm" title="">Portada</a></li>
		<li><a href="VerTodas.htm" title="">Ver Todas</a></li>
		</ul>
</div>
</div>
	

<div id="content">

<h2>Nueva Nota</h2>

<c:if test="${sessionScope.usuario > 0}">

<form:form  method="post"  commandName="NuevoNotaForm">
<table>
  <tr>
    <td>
    Titulo 
    </td>
    <td>
    <form:input path="titulo"/>
    </td>
  </tr>
 <tr>
    <td>
    Descripcion  
    </td>
    <td>
    <form:textarea path="descripcion" rows="3" cols="25"/>
    </td>
  </tr>
  <tr> 
    <td width="20px"/>
    <td> 
      <table>
        <c:forEach items="${ListaPartidos}" var="partido">  
          <tr><td>      
            <input type="checkbox" name="partidosId" value="${partido.getId()} "/>  <c:out value="${partido.getIniciales()}"/>  
          </td></tr>
        </c:forEach>        
      </table>
    </td>
  </tr>
  <tr>
    <td>
    <input type="submit" value="Nueva Nota">
    </td>
  </tr>
</table>
</form:form>
</c:if>

</div>

<div id="footer"><p><a href="#">homepage</a> | <a href="mailto:denise@mitchinson.net">contact</a> | &copy; 2008 Anyone | Design by <a href="http://www.mitchinson.net"> www.mitchinson.net</a> |  Licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/3.0/">Creative Commons Attribution 3.0  License</a></p></div>

</div>

</body>
</html>