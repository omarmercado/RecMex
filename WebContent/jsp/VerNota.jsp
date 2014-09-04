<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>RecPolitica : Ver Nota</title>
<link href="theme/style.css" rel="stylesheet" type="text/css" />

</head>
<body>

<div id="container">
<div id="top"><h1><span>RecPolitica.com</span></h1></div>

<div id="navcontainer">
<div id="topnav">
		<ul>
		<li><a href="Portada.htm" title="">Portada</a></li>
		<li><a href="VerTodas.htm" title="">Ver Todas</a></li>
		</ul>
</div>
</div>
	

<div id="content">

<h2>Nota</h2>

<table width="100%">
<tr>
<form name="EditarNotaForm" method="post" action="/EditarNota.htm">
<td width="60%" valign="left">
  <table width="100%" >
    <tr >
      <td width="100%">     
        <c:choose>
          <c:when test="${sessionScope.usuario > 0}">    
             <input type="text" name="txtTitulo" id="txtTitulo" 
                             style="outline:none;background-color: transparent;border:none" value="<c:out value="${nota.getTitulo()}"/>"/> 
          </c:when>
          <c:when test="${empty sessionScope.usuario}">    
            <label style="font-size: 150%;font-style: italic;">${nota.getTitulo()}</label>         
          </c:when>
        </c:choose>     
      </td>
    </tr>
    <tr>
      <td width="100%">
        <c:choose>
          <c:when test="${sessionScope.usuario > 0}">  
            <textarea name="txtDescripcion" id="txtDescripcion" style="outline:none;background-color: transparent;border:none" cols="60" rows="30">
              ${nota.getDescripcion()} 
            </textarea>          
          </c:when>
          <c:when test="${empty sessionScope.usuario}">  
            <p style="font-size: 130%">" ${nota.getDescripcion()} "</p>
          </c:when>
        </c:choose>
      </td>
    </tr>
    </table>
</td>
<input type="hidden" id="txtId" name="txtId" value="${nota.getId()}">
<c:if test="${sessionScope.usuario > 0}">  
<input type="submit" value="Editar" >
</c:if>
</form>

<c:if test="${sessionScope.usuario > 0}">  
  <form name="EliminarNotaForm" action="/EliminarNota.htm" method="post">
    <input type="hidden" id="txtId" name="txtId" value="${nota.getId()}">
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
        <c:forEach items="${nota.getPartidos()}"  var="partido">
          <img src="img/<c:out value="${partido.getImagen()}"/>.png" alt="<c:out value="${partido.getNombre()}"/>
               "height="10%" width="10%"/>        
        </c:forEach>
      </td>
    </tr>
    </table>
</td>
</tr>    
</table>    
    
  <form name="EliminarArticuloForm" action="EliminarArticulo.htm" method="post">  
  <table width="90%">       
  <tr>
    <th width="30%"> Articulos Disponibles </th>
  </tr>
    <c:forEach items="${nota.getArticulos()}"  var="articulo">
      <tr> 
        <td width="100%" style="background : #F7FAFB;">
        <table>
          <tr><td>              
            <c:out value="${articulo.getTitulo()}"/>  <a href="http://<c:out value="${articulo.getUrl()}"/>" target="_blank">ir a articulo</a> 
          </td></tr>
          <tr><td>     
             <p> Autor : <c:out value="${articulo.getAutor()}"/> </p>
          
          <input type="hidden" id="txtId" name="txtId" value="${articulo.getId()}">
          <input type="hidden" id="txtNotaId" name="txtNotaId" value="${nota.getId()}">
          
          <c:if test="${sessionScope.usuario > 0}">            
          <input type="submit" value="Eliminar">          
          </c:if>
          </td></tr>
          </table>
        </td>
      </tr>
    </c:forEach>     
  </table>
  </form>
</div>

<c:if test="${sessionScope.usuario > 0}">
<div>
<form name="frmNewArticulo" method="post" action="NewArticulo.htm">
<input id="notaId" name="notaId" type="hidden" value="${nota.getId()}"/>
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

<div id="footer"><p><a href="#">homepage</a> | <a href="mailto:denise@mitchinson.net">contact</a> | &copy; 2008 Anyone | Design by <a href="http://www.mitchinson.net"> www.mitchinson.net</a> |  Licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/3.0/">Creative Commons Attribution 3.0  License</a></p></div>

</div>
</body>
</html>