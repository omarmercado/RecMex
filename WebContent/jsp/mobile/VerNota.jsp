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

<div id="topnav">
		<ul>
		<li><font size="100%"><a href="Portada.htm">Portada</a></font></li>
		<li><font size="100%"><a href="VerTodas.htm">Ver Todas</a></font></li>
		<li><font size="100%"><a href="VerTodasCasos.htm">Casos Especiales</a></font></li>						
		</ul>
</div>

<table width="100%">
  <tr>
    <td align="left">
  </td>
    <td align="right">
       <p>Siguenos en <font style="font-size: 200%">Twitter :</font> <a href="https://twitter.com/RecPolitica" class="twitter-follow-button" data-show-count="false" data-size="large">Follow @RecPolitica</a>
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
 <font style="font-size: 200%">Email : RecPolitica@outlook.com</font>
</td>

</tr>
</table>


<div id="container">

<div id="content">

<h2>Nota</h2>

<table width="100%" height="100%">
<tr>
<td width="100%">
  <table width="100%" >
    <tr >
      <td width="100%">     
            <label style="font-style: italic;font-size: 300%;line-height: 1.2">${nota.getTitulo()}</label>         
      </td>
    </tr>
    <tr>
      <td width="70%" align="center">
              <font style="font-size: 200%;line-height: 1.2"><p align="justify">${nota.getDescripcion()}</p></font>     
      </td>
    </tr>
    </table>
</td>
</tr>

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
               "height="50%" width="12%"/>        
        </c:forEach>
      </td>
    </tr>
    </table>
</td>
</tr>    
</table>    
    
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
             <p> <font style="font-size: 150%"> Autor :  <c:out value="${articulo.getAutor()}"/> </font> </p>

          </td></tr>
          </table>
        </td>
      </tr>
    </c:forEach>     
  </table>
</div>


<div id="footer"><p><a href="Portada.htm">homepage</a> | <a href="mailto:RecPolitica@outlook.com">contact</a></p></div>

</div>
</body>
</html>