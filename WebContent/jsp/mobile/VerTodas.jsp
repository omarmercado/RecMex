<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    
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
		</ul>
</div>

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
               height="10%" width="10%"  onclick="formSubmit(${partido.getId()})"/>        
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
        <td width="100%" style="background : #F7FAFB url(images/column.gif) no-repeat;">
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
                  ${nota.getDescripcion()}
               </font>
             </td>
           </tr>
           <tr>
             <td>    
              <c:forEach items="${nota.getPartidos()}"  var="partido">
                <img src="img/<c:out value="${partido.getImagen()}"/>.png" alt="<c:out value="${partido.getNombre()}"/>
                     "height="5%" width="5%"  onclick="formSubmit(${partido.getId()})"/>        
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

<div id="footer"><p><a href="#">homepage</a> | <a href="mailto:denise@mitchinson.net">contact</a> | &copy; 2008 Anyone | Design by <a href="http://www.mitchinson.net"> www.mitchinson.net</a> |  Licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/3.0/">Creative Commons Attribution 3.0  License</a></p></div>

</div>

</body>
</html>