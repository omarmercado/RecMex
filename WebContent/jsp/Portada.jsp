<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>RecPolitica.com</title>
<link href="theme/style.css" rel="stylesheet" type="text/css" />
</head>

<body>

<div id="container">
<div id="top"><h1><span style="color:#259FDA; font-size:14pt;">RecPolitica.com</span></h1></div>

<div id="navcontainer">
<div id="topnav">
		<ul>
		<li><a href="Portada.htm" title="">Portada</a></li>
		<li><a href="VerTodas.htm" title="">Ver Todas</a></li>
		
		<c:if test="${sessionScope.usuario > 0}">
          <li><a href="NuevoNota.htm" title="">Nueva Nota</a></li>
        </c:if>

		</ul>
</div>
</div>
	
<div id="content">

<h2>Ultimas Notas</h2>


<table width="100%" height="300px">
  <tr>
      <c:forEach var="lista" items="${ListaPartidos1}">
        <c:forEach var="map" items="${lista}">
          <td width="20%" height="300px" style="border: 1px solid #eee;background : #F7FAFB url(images/column.gif) no-repeat;">  
            <table width="100%" height="100%">
              <tr height="30%"> 
                <td><img src="img/<c:out value="${map.key.getImagen()}"/>.png" alt="<c:out value="${map.key.getNombre()}"/>"  width="50%"/></td> 
              </tr>
              <tr height="70%" bgcolor="white">
                <td style="background : #F7FAFB url(images/column.gif) no-repeat;" align="left" valign="top">  
                  <ul> 
                    <c:forEach var="notas" items="${map.value}">
                      <li><a href="/RecMex/VerNota.htm?notaId=<c:out value="${notas[0]}"/>"> <c:out value="${notas[1]}"/></a></li>     
                    </c:forEach>
                  </ul>
                </td>         
              </tr>
            </table>
          </td>
        </c:forEach>
      </c:forEach>          
  </tr>
    <tr>
      <c:forEach var="lista" items="${ListaPartidos2}">
        <c:forEach var="map" items="${lista}">
          <td width="20%" height="300px"  style="border: 1px solid #eee;background : #F7FAFB url(images/column.gif) no-repeat;">  
            <table width="100%" height="100%">
              <tr height="30%"> 
                <td><img src="img/<c:out value="${map.key.getImagen()}"/>.png" alt="<c:out value="${map.key.getNombre()}"/>"  width="50%"/></td> 
              </tr>
              <tr height="70%" bgcolor="white">
                <td  style="background : #F7FAFB url(images/column.gif) no-repeat;" align="left" valign="top"> 
                <ul> 
                  <c:forEach var="notas" items="${map.value}">
                   <li><a href="/RecMex/VerNota.htm?notaId=<c:out value="${notas[0]}"/>"> <c:out value="${notas[1]}"/></a></li>     
                  </c:forEach>
                 </ul>
                </td>         
              </tr>
            </table>
          </td>
        </c:forEach>
      </c:forEach>          
  </tr>
</table>

</div>

<div id="footer"><p><a href="#">homepage</a> | <a href="mailto:denise@mitchinson.net">contact</a> | &copy; 2008 Anyone | Design by <a href="http://www.mitchinson.net"> www.mitchinson.net</a> |  Licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/3.0/">Creative Commons Attribution 3.0  License</a></p></div>

</div>
</body>
</html>