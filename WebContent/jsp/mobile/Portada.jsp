<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>RecPolitica.com</title>
<link href="mobile/theme/style.css" rel="stylesheet" type="text/css" />
</head>

<body>



<div align="left" style="width: 10%">
<img  width="100%" src="theme/images/REC.png" align="left" />
</div>

<h1><span style="color:red; font-size:300%;">RecPolitica.com</span></h1>

<div id="topnav">
		<ul>
		<li><font size="100%"><a href="Portada.htm" title="">Portada</a></font></li>
		<li><font size="100%"><a href="VerTodas.htm" title="">Ver Todas</a></font></li>
		<li><font size="100%"><a href="VerTodasCasos.htm">Casos Especiales</a></font></li>						
		</ul>
</div>

<table width="100%">
  <tr>
    <td align="right">
       <p>Siguenos en Twitter : <a href="https://twitter.com/RecPolitica" class="twitter-follow-button" data-show-count="false" data-size="large">Follow @RecPolitica</a>
<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>
</p>
</td>
</tr>
</table>

<div id="container">
	
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
<br>

<table width="100%" height="90%">
  <tr>
  <td width="100%" height="20%" style="border: 1px solid #eee;background : #F7FAFB;">  
      <c:forEach var="lista" items="${ListaPartidos1}">
        <c:forEach var="map" items="${lista}">
          
            <table width="100%" height="100%">
              <tr height="30%"> 
                <td width="35%">
                  <img  width="100%" src="img/<c:out value="${map.key.getImagen()}"/>.png" alt="<c:out value="${map.key.getNombre()}"/>"/>
                 </td> 
              
             <td width="5%"> </td>
              
              
                <td style="background : #F7FAFB;" align="left" width="50%" valign="top">  
                  <c:forEach var="notas" items="${map.value}">
                    <font style="font-size: 200%">
                      <a href="VerNota.htm?notaId=<c:out value="${notas[0]}"/>"> <c:out value="${notas[1]}"/> </a>  
                    </font>     
                    <br><br>
                  </c:forEach>
                </td>         
              </tr>
            </table>
        </c:forEach>
      </c:forEach>
      </td>          
  </tr>
</table>
<hr>

<h2>Casos Especiales</h2>


<table width="90%">
<c:forEach var="caso" items="${ListaCasos}">
  <tr>
  <td width="45%" height="30%" style="border: 1px solid #eee;background : #F7FAFB;">  
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
  </c:forEach>
</table>


</div>

<div id="footer"><p><a href="#">homepage</a> | <a href="mailto:denise@mitchinson.net">contact</a> | &copy; 2008 Anyone | Design by <a href="http://www.mitchinson.net"> www.mitchinson.net</a> |  Licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/3.0/">Creative Commons Attribution 3.0  License</a></p></div>

</div>
</body>
</html>