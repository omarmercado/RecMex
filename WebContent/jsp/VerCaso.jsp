<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>RecPolitica : Ver Caso</title>
<link href="theme/style.css" rel="stylesheet" type="text/css" />

</head>
<body>

<div id="container">
<div id="top"><h1><span>RecPolitica.com</span></h1></div>

<div id="navcontainer">
<div id="topnav">
		<ul>
		<li><a href="Portada.htm" title=""><font style="font-size: 120%">Portada </font></a></li>
		<li><a href="VerTodas.htm" title=""><font style="font-size: 120%">Ver Todas</font></a></li>
		<li><a href="VerTodasCasos.htm"><font style="font-size: 120%">Casos Especiales</font></a></li>						
		</ul>
</div>
</div>
<table width="100%">
  <tr>
    <td align="left">
  </td>
    <td align="right">
       <p>Siguenos en Twitter : <a href="https://twitter.com/RecPolitica" class="twitter-follow-button" data-show-count="false">Follow @RecPolitica</a>
<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>
</p>
</td>
</tr>
<tr>
<td align="left">
<font style="font-size: 200%">
 Rompiendo el Ciclo Noticioso de 24 Horas
  </font>
  </td>
<td align="right">
Email : RecPolitica@outlook.com
</td>

</tr>
</table>

<div id="content">

<h4> Ultima Actualizacion : ${caso.getUltimaActualizacion()}</h4>

<table width="100%">
<tr>
<form name="EditarCasoForm" method="post" action="/EditarCaso.htm">
<td width="60%" valign="left">
  <table width="100%" >
    <tr >
      <td width="100%">     
        <c:choose>
          <c:when test="${sessionScope.usuario > 0}">    
             <input type="text" name="txtTitulo" id="txtTitulo" 
                             style="outline:none;background-color: transparent;border:none" value="<c:out value="${caso.getTitulo()}"/>"/> 
          </c:when>
          <c:when test="${empty sessionScope.usuario}">    
            <label style="font-size: 200%;font-weight: bold;">${caso.getTitulo()}</label>         
          </c:when>
        </c:choose>     
      </td>
    </tr>
    <tr>
      <td width="100%">
        <c:choose>
          <c:when test="${sessionScope.usuario > 0}">  
            <textarea name="txtDescripcion" id="txtDescripcion" style="outline:none;background-color: transparent;border:none" cols="60" rows="30">
              ${caso.getDescripcion()} 
            </textarea>          
          </c:when>
          <c:when test="${empty sessionScope.usuario}">  
            <p style="font-size: 180%">" ${caso.getDescripcion()} "</p>
          </c:when>
        </c:choose>
      </td>
    </tr>
    </table>
</td>
<input type="hidden" id="txtId" name="txtId" value="${caso.getId()}">
<c:if test="${sessionScope.usuario > 0}">  
<input type="submit" value="Editar" >
</c:if>
</form>

<c:if test="${sessionScope.usuario > 0}">  
  <form name="EliminarCasoForm" action="/EliminarCaso.htm" method="post">
    <input type="hidden" id="txtId" name="txtId" value="${caso.getId()}">
    <input type="submit" value="Borrar" >
  </form>
</c:if>

<td width="40%" valign="top">
  <table width="100%"> 
  <tr>
    <th align="left" style="font-weight: bolder;" >Partidos Involucrados</th>
  </tr>  
    <tr>     
      <td align="left">
        <c:forEach items="${caso.getPartidos()}"  var="partido">
          <img src="img/<c:out value="${partido.getImagen()}"/>.png" alt="<c:out value="${partido.getNombre()}"/>
               "height="10%" width="10%"/>        
        </c:forEach>
      </td>
    </tr>
    </table>
</td>
</tr>    
</table>    

<table width="80%%">
  <tr>
    <td align="center">
      <h2 style="font-size: 120%">Articulos Disponibles</h2>
    </td>
  </tr>
</table>

<c:forEach items="${caso.getArticulos()}"  var="articulo">    
  <form name="EliminarArticuloCasoForm" action="EliminarArticuloCaso.htm" method="post">  
  <table width="90%">       
      <tr> 
        <td width="100%" style="background : #F7FAFB;">
        <table>
          <tr><td>
            <font style="font-size: 180%">              
              <c:out value="${articulo.getTitulo()}"/>  <a href="http://<c:out value="${articulo.getUrl()}"/>" target="_blank">ir a articulo</a> 
            </font>
          </td></tr>
          <tr><td>     
             <p><font style="font-size: 160%"> Autor : <c:out value="${articulo.getAutor()}"/> </font></p>
          <input type="hidden" id="txtId" name="txtId" value="${articulo.getId()}">
          <input type="hidden" id="txtCasoId" name="txtCasoId" value="${caso.getId()}">
          
          <c:if test="${sessionScope.usuario > 0}">            
          <input type="submit" value="Eliminar">          
          </c:if>
          
          </td></tr>
          </table>
        </td>
      </tr>     
  </table>
  </form>
  <br>
</c:forEach>  
</div>

<c:if test="${sessionScope.usuario > 0}">
<div>
<form name="frmNewArticuloCaso" method="post" action="NewArticuloCaso.htm">
<input id="casoId" name="casoId" type="hidden" value="${caso.getId()}"/>
  <table>
    <tr>
      <td>
        Titulo : <input type="text" id="txtTitulo" name="txtTitulo"/>
      </td>
    </tr>
    <tr>
      <td>
        Autor : <input type="text" id="txtAutor" name="txtAutor"/>
      </td>
    </tr>
    <tr>
      <td>
        URL : <input type="text" id="txtUrl"  name="txtUrl"/>
      </td>
    </tr>
    <tr>
      <td>
        <input type="submit" value="Aceptar">
      </td>
    </tr>
  </table>
</form>
</div>
</c:if>

<div id="footer"><p><a href="Portada.htm">homepage</a> | <a href="mailto:RecPolitica@outlook.com">contact</a> || Design by <a href="http://www.mitchinson.net"> www.mitchinson.net</a> |  Licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/3.0/">Creative Commons Attribution 3.0  License</a></p></div>

</div>
</body>
</html>