<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>RecPolitica: Ver Todas</title>
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
<div id="top"><h1>     <span style="color:#259FDA; font-size:14pt;">RecPolitica.com</span></h1></div>

<div id="navcontainer">
<div id="topnav">
		<ul>
		<li><a href="Portada.htm" title="">Portada</a></li>
		<li><a href="VerTodas.htm" title="">Ver Todas</a></li>
		</ul>
</div>
</div>
	

<div id="content">

<h2>Notas por Partido</h2>


<form name="frmVerTodas" id="frmVerTodas" action="VerTodas.htm" method="post">
  <input type="hidden" name="partidoId" id="partidoId">
  <table width="100%"> 
  <tr> <td width="100%"> Hacer Click sobre el partido qpara ver sus notas </td> </tr>   
    <tr align="left">    
     
      <td align="left" width="100%">
        <c:forEach items="${ListaPartidos}"  var="partido">
          <img src="img/<c:out value="${partido.getImagen()}"/>.png" alt="<c:out value="${partido.getNombre()}"/>"
               height="10%" width="10%"  onclick="formSubmit(${partido.getId()})"/>        
        </c:forEach>
      </td>
    </tr>
    </table>
</form>


  <table width="100%">       
    <c:forEach items="${ListaNotas}"  var="nota">
      <tr>
        <td width="100%" style="background : #F7FAFB url(images/column.gif) no-repeat;">
         <table>
          <tr><td>              
            <c:out value="${nota.getTitulo()}"/>
          </td></tr>
          <tr><td>     
            <c:out value="${nota.getDescripcion()}"/>
          </td></tr>
          <tr><td>    
            <c:forEach items="${nota.getPartidos()}"  var="partido">
              <img src="img/<c:out value="${partido.getImagen()}"/>.png" alt="<c:out value="${partido.getNombre()}"/>
                   "height="5%" width="5%"  onclick="formSubmit(${partido.getId()})"/>        
            </c:forEach>          
          </td></tr>
        </table>        
        </td>
      </tr>
      <tr>
        <td>
          <a href="VerNota.htm?notaId=<c:out value="${nota.getId()}"/>" > ir a nota </a>
        </td>
      </tr>
    </c:forEach>     
  </table>


</div>

<div id="footer"><p><a href="#">homepage</a> | <a href="mailto:denise@mitchinson.net">contact</a> | &copy; 2008 Anyone | Design by <a href="http://www.mitchinson.net"> www.mitchinson.net</a> |  Licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/3.0/">Creative Commons Attribution 3.0  License</a></p></div>

</div>

</body>
</html>