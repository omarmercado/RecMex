<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>RecPolitica: Ver Todas</title>
<link href="mobile/theme/style.css" rel="stylesheet" type="text/css" />
</head>

<script type="text/javascript">

function formSubmit(partidoId){		
	document.frmVerTodas.partidoId.value = partidoId;
	document.frmVerTodas.submit();	
}

</script>

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
    <td align="right">
       <p>Siguenos en Twitter : <a href="https://twitter.com/RecPolitica" class="twitter-follow-button" data-show-count="false" data-size="large">Follow @RecPolitica</a>
<script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0],p=/^http:/.test(d.location)?'http':'https';if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src=p+'://platform.twitter.com/widgets.js';fjs.parentNode.insertBefore(js,fjs);}}(document, 'script', 'twitter-wjs');</script>
</p>
</td>
</tr>
</table>

<div id="container">
	

<div id="content">

<h2>Casos s Seguir</h2>
<br>

  <table width="100%" cellspacing="2">       
    <c:forEach items="${ListaCasos}"  var="caso">
      <tr>
        <td width="100%" style="background : #F7FAFB;">
         <table>
           <tr>
             <td>
               <font style="font-size: 200%; font-style: italic;">       
                 <a style="text-decoration:none;" href="VerCaso.htm?casoId=<c:out value="${caso.getId()}"/>" >${caso.getTitulo()}</a> 
               </font>
             </td>
           </tr>
            <tr>
             <td>
               <font style="font-size: 150%; font-style: italic;">       
                  Ultima Actualizacion : ${caso.getUltimaActualizacion()} 
               </font>
             </td>
           </tr>           
           <tr>
             <td>     
               <font style="font-size: 150%">
                  ${fn:substring(caso.getDescripcion(), 0, 100)} ...
               </font>
             </td>
           </tr>
           <tr>
             <td>    
              <c:forEach items="${caso.getPartidos()}"  var="partido">
                <img src="img/<c:out value="${partido.getImagen()}"/>.png" alt="<c:out value="${partido.getNombre()}"/>
                     "height="20%" width="10%"  onclick="formSubmit(${partido.getId()})"/>        
              </c:forEach>          
             </td>
           </tr>
        </table>        
        </td>
      </tr>
      <tr>
        <td><font style="font-size: 160%">
          <a href="VerCaso.htm?casoId=<c:out value="${caso.getId()}"/>" > ir a caso </a>
          </font>
        </td>      
      </tr>
<tr height="20px"><td height="20px"></td></tr>
    </c:forEach>     
  </table>


</div>

<div id="footer"><p><a href="#">homepage</a> | <a href="mailto:denise@mitchinson.net">contact</a> | &copy; 2008 Anyone | Design by <a href="http://www.mitchinson.net"> www.mitchinson.net</a> |  Licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/3.0/">Creative Commons Attribution 3.0  License</a></p></div>

</div>

</body>
</html>