<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>RecPolitica: Ver Casos</title>
<link href="theme/style.css" rel="stylesheet" type="text/css" />
</head>

<script type="text/javascript">

function formSubmit(partidoId){		
	document.frmVerTodas.partidoId.value = partidoId;
	document.frmVerTodas.submit()	
}

</script>

<body>

<div id="container">
<div id="top"><h1><span>RecPolitica.com</span></h1></div>

<div id="navcontainer">
<div id="topnav">
		<ul>
		<li><a href="Portada.htm">Portada</a></li>
		<li><a href="VerTodas.htm">Ver Todas</a></li>
		<li><a href="VerTodasCasos.htm">Casos Especiales</a></li>						
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

<h2>Casos a Seguir</h2>



  <table width="100%">       
    <c:forEach items="${ListaCasos}"  var="caso">
      <tr>
        <td width="100%" style="background : #F7FAFB;">
         <table>
          <tr><td>              
            <font style="font-size: 200%">${caso.getTitulo()}</font>
          </td></tr>
          <tr><td>
          <font style="font-size: 100%">
          Ultima Actualizacion : ${caso.getUltimaActualizacion()}
          </font>
          </td></tr>
          <tr><td>     
            <c:out value="${caso.getDescripcion()}"/>
          </td></tr>
          <tr><td>    
            <c:forEach items="${caso.getPartidos()}"  var="partido">
              <img src="img/<c:out value="${partido.getImagen()}"/>.png" alt="<c:out value="${partido.getNombre()}"/>
                   "height="5%" width="5%"  onclick="formSubmit(${partido.getId()})"/>        
            </c:forEach>          
          </td></tr>
        </table>        
        </td>
      </tr>
      <tr>
        <td><font style="font-size: 150%">
          <a href="VerCaso.htm?casoId=<c:out value="${caso.getId()}"/>" > ir a caso </a>
        </font></td>
      </tr>
    </c:forEach>     
  </table>


</div>

<div id="footer"><p><a href="#">homepage</a> | <a href="mailto:denise@mitchinson.net">contact</a> | &copy; 2008 Anyone | Design by <a href="http://www.mitchinson.net"> www.mitchinson.net</a> |  Licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/3.0/">Creative Commons Attribution 3.0  License</a></p></div>

</div>

</body>
</html>