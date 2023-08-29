<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Title</title>
</head>
<body>
<h1>Edit product</h1>
<p>
  <c:if test = "${message} != null">
    <span>${message}</span>
  </c:if>
</p>
<p>
  <a href="/products">Back to product</a>
<form method="post" action="/products?action=edit">
  <fieldset>
    <legend>Product Information</legend>
    <table>
      <tr>
        <td>Id:</td>
        <td><input type = "text" name="id" readonly value="${product.getId()}"></td>
      </tr>
      <tr>
        <td>Name product:</td>
        <td><input type = "text" name="productName" value="${product.getProductName()}"></td>
      </tr>
      <tr>
        <td>Price:</td>
        <td><input type = "text" name="price" value="${product.getPrice()}"></td>
      </tr>
      <tr>
        <td>Description:</td>
        <td><input type = "text" name="description" value="${product.getDescription()}"></td>
      </tr>
      <tr>
        <td>Producer:</td>
        <td><input type = "text" name="producer" value="${product.getProducer()}"></td>
      </tr>
      <tr>
        <td></td>
        <td><input type = "submit"value="Update"></td>
      </tr>
    </table>
  </fieldset>
</form>
</p>

</body>
</html>
