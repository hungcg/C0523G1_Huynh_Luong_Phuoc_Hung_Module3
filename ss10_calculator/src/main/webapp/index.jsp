
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
  <title>$Title$</title>
</head>
<body>
<h1>Simple Calculator</h1>
<form action="/calculator" method="post">
  <table border="1">
    First operand: <input type="text" name="first">
    Operator: <select name="operator" id="Chọn" >
    <optgroup label="Choose">
      <option value="addition">+</option>
      <option value="subtraction">_</option>
      <option value="multiplication">x</option>
      <option value="division">/</option>
    </optgroup>

  </select>
    Second operator: <input type="text" name="second">
    <input type="submit" value="calculator">
  </table>
</form>
${result}
</body>
</html>