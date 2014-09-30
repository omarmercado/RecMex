<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>RecPolitica : Ingresar</title>
<link href="../theme/style.css" rel="stylesheet" type="text/css" />
</head>

<body>

<div id="container">
<div id="top"><h1>     <span style="color:#259FDA; font-size:14pt;">     RecPolitica.com</span></h1></div>

<div id="navcontainer">
<div id="topnav">
		<ul>
		<li><a href="/Portada.htm" title="">Portada</a></li>
		</ul>
</div>
</div>
	

<div id="content">

<h2>Ingresar</h2>

<form name="frmIngresar" action="../Ingresar.htm" method="post" >
<table>
  <tr>
    <td>Usuario : </td>
    <td> <input type="text" id="txtEmail" name="txtEmail"> </td>
  </tr>
  <tr>  
    <td>Contrasena :  </td>
    <td><input type="text" id="txtContrasena" name="txtContrasena"></td>
  </tr>
  <tr>
    <td><input type="submit" value="Ingresar"></td>
  </tr>
</table>
</form>

</div>

<div id="footer"><p><a href="Portada.htm">homepage</a> | <a href="mailto:RecPolitica@outlook.com">contact</a> || Design by <a href="http://www.mitchinson.net"> www.mitchinson.net</a> |  Licensed under a <a rel="license" href="http://creativecommons.org/licenses/by/3.0/">Creative Commons Attribution 3.0  License</a></p></div>

</div>
</body>
</html>