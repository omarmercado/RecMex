<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>RecPolitica : Ver Nota</title>
<link href="mobile/theme/style.css" rel="stylesheet" type="text/css" />

</head>
<body>


<div align="left" style="width: 10%">
<img  width="100%" src="theme/images/REC.png" align="left" />
</div>

<h1><span style="color:red; font-size:300%;">RecPolitica.com</span></h1>


<div id="container">

<div id="topnav">
		<ul>
		<li><font size="100%"><a href="Portada.htm">Portada</a></font></li>
		<li><font size="100%"><a href="VerTodas.htm">Ver Todas</a></font></li>
		</ul>
</div>

	

<div id="content">

<h2>Nota</h2>

<table width="100%" height="100%">
<tr>
<form name="EditarNotaForm" method="post" action="/EditarNota.htm">
<td width="100%">
  <table width="100%" >
    <tr >
      <td width="100%">     
        <c:choose>
          <c:when test="${sessionScope.usuario > 0}">    
             <input type="text" name="txtTitulo" id="txtTitulo" 
                             style="outline:none;background-color: transparent;border:none" value="<c:out value="${nota.getTitulo()}"/>"/> 
          </c:when>
          <c:when test="${empty sessionScope.usuario}">    
            <label style="font-style: italic;font-size: 300%">${nota.getTitulo()}</label>         
          </c:when>
        </c:choose>     
      </td>
    </tr>
    <tr>
      <td width="70%" align="center">
        <c:choose>
          <c:when test="${sessionScope.usuario > 0}">  
            <textarea name="txtDescripcion" id="txtDescripcion" style="outline:none;background-color: transparent;border:none" cols="60" rows="30">
                      ${nota.getDescripcion()} 
          </c:when>
          <c:when test="${empty sessionScope.usuario}">  
              <font style="font-size: 200%"><p align="justify">${nota.getDescripcion()}</p></font>
            </textarea>
          </c:when>
        </c:choose>
      </td>
    </tr>
    </table>
</td>
</tr>
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
<tr>
<td width="100%">
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
    <th width="30%"><font style="font-size: 200%"> Articulos Disponibles</font> </th>
  </tr>
    <c:forEach items="${nota.getArticulos()}"  var="articulo">
      <tr> 
        <td width="100%" >
        <table>
          <tr><td>  
            <font style="font-size: 150%">            
              <c:out value="${articulo.getTitulo()}"/>  <a href="http://<c:out value="${articulo.getUrl()}"/>" target="_blank">ir a articulo</a> 
            </font>
          </td></tr>
          <tr><td>     
             <p> Autor : <font style="font-size: 100%">   <c:out value="${articulo.getAutor()}"/> </font> </p>
          
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