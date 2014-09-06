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
<div id="top"><h1><span>RecPolitica.com</span></h1></div>

<div id="navcontainer">
<div id="topnav">
		<ul>
		<li><a href="Portada.htm">Portada</a></li>
		<li><a href="VerTodas.htm">Ver Todas</a></li>
		<li><a href="VerTodasCasos.htm">Casos Especiales</a></li>				
		<c:if test="${sessionScope.usuario > 0}">
          <li><a href="NuevoNota.htm">Nueva Nota</a></li>
          <li><a href="NuevoCaso.htm">Nuevo Caso</a></li>
        </c:if>
		</ul>
</div>
</div>

<table width="100%">
  <tr>
    <td align="right">
       <p>Siguenos en Twitter : <a href="https://twitter.com/RecPolitica" class="twitter-follow-button" data-show-count="false">Follow @RecPolitica</a>
<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>
</p>
</td>
</tr>
</table>
	
<div id="content">



<table width="100%">
  <tr>
    <td align="left">
      <h1>Ultimas Notas</h1>
    </td>
    <td align="right">
      <h1>Ultima Actualizacion : ${Pagina.getUltimaActualizacion()}</h1>
    </td>
  </tr>
</table>

<table width="100%" height="300px">
  <tr>
      <c:forEach var="lista" items="${ListaPartidos1}">
        <c:forEach var="map" items="${lista}">
          <td width="20%" height="300px" style="border: 1px solid #eee;background : #F7FAFB ;">  
            <table width="100%" height="100%">
              <tr height="30%"> 
                <td>
                   <img  src="img/<c:out value="${map.key.getImagen()}"/>.png" alt="<c:out value="${map.key.getNombre()}"/>" width="50%"/>
                </td> 
              </tr>
              <tr height="70%" bgcolor="white">
                <td style="background : #F7FAFB;" align="left" valign="top">  
                  <ul> 
                    <c:forEach var="notas" items="${map.value}">
                      <li><a href="VerNota.htm?notaId=<c:out value="${notas[0]}"/>"> <c:out value="${notas[1]}"/></a></li>     
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
          <td width="20%" height="300px"  style="border: 1px solid #eee;background : #F7FAFB;">  
            <table width="100%" height="100%">
              <tr height="30%"> 
                <td height="30%" width="30%">
                  <img src="img/<c:out value="${map.key.getImagen()}"/>.png" alt="<c:out value="${map.key.getNombre()}"/>"width="50%" height="100%"/>
                </td> 
              </tr>
              <tr>
                <td style="background : #F7FAFB;" align="left" valign="top"> 
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

<h2>Casos Especiales</h2>

<table >
<tr>
<c:forEach var="caso" items="${ListaCasos}">
  <td width="25%" height="30%" style="border: 1px solid #eee;background : #F7FAFB;">  
    <table>
    <tr>
      <td>
        <a href="VerCaso.htm?casoId=<c:out value="${caso.getId()}"/>">
          <img src="img/<c:out value="${caso.getImagen()}"/>.png" alt="<c:out value="${caso.getTitulo()}"/>" /> 
        </a>
      </td>          
    </tr>
    <tr>
      <td>  
        Ultima Actualizacion : ${caso.getUltimaActualizacion()} 
      </td> 
    </tr>  
  </table>
  </td>       
  </c:forEach>
</tr>
</table>

</div>

<div id="footer"><p><a href="#">homepage</a> | <a href="mailto:denise@mitchinson.net">contact</a> | &copy; 2008 Anyone | Design by <a href="http://www.mitchinson.net"> www.mitchinson.net</a> |  Licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/3.0/">Creative Commons Attribution 3.0  License</a></p></div>

</div>
</body>
</html>