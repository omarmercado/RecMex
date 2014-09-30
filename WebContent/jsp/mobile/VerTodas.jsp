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
    <td align="left">
  </td>
    <td align="right">
       <p>Siguenos en <font style="font-size: 200%">Twitter : </font><a href="https://twitter.com/RecPolitica" class="twitter-follow-button" data-show-count="false" data-size="large">Follow @RecPolitica</a>
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

<h2>Notas por Partido</h2>
<br>

<form name="frmVerTodas" id="frmVerTodas" action="VerTodas.htm" method="post">
  <input type="hidden" name="partidoId" id="partidoId">
  <table width="100%" cellspacing="10"> 
  <tr><td> <font style="font-size: 300%">Elige el partido para ver sus Notas</font> </td></tr>   
    <tr align="left">    
     
      <td align="left" width="100%">
        <c:forEach items="${ListaPartidos}"  var="partido">
          <img src="img/<c:out value="${partido.getImagen()}"/>.png" alt="<c:out value="${partido.getNombre()}"/>"
               height="50%" width="12%"  onclick="formSubmit(${partido.getId()})"/>        
        </c:forEach>
      </td>
    </tr>
    </table>
</form>

<br>
<br>
<br>

  <table width="100%" cellspacing="2">       
    <c:forEach items="${ListaNotas}"  var="nota">
      <tr>
        <td width="100%" style="background : #F7FAFB;">
         <table>
           <tr>
             <td>
               <font style="font-size: 200%; font-style: italic;">       
                 <a style="text-decoration:none;" href="VerNota.htm?notaId=<c:out value="${nota.getId()}"/>" >${nota.getTitulo()}</a> 
               </font>
             </td>
           </tr>
           <tr>
             <td>     
               <font style="font-size: 150%">
                  ${fn:substring(nota.getDescripcion(), 0, 100)} ...
               </font>
             </td>
           </tr>
           <tr>
             <td>    
              <c:forEach items="${nota.getPartidos()}"  var="partido">
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
          <a href="VerNota.htm?notaId=<c:out value="${nota.getId()}"/>" > ir a nota </a>
          </font>
        </td>      
      </tr>
<tr height="20px"><td height="20px"></td></tr>
    </c:forEach>     
  </table>


</div>

<div id="footer"><p><a href="Portada.htm">homepage</a> | <a href="mailto:RecPolitica@outlook.com">contact</a></p></div>

</div>

</body>
</html>