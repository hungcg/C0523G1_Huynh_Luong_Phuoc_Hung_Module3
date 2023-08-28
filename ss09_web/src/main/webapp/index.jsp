<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
  <title>Calculator</title>
  <style>
    form{
      padding: 50px;
      background: burlywood;
      width: 300px;
    }
    input{
      margin-left: 100px;
    }
    button{
      margin: 30px 100px;
      padding: 5px;
    }
  </style>
</head>
<body>

<form action="/calculator" method="post">
  <label for="description">Product Description :</label>
  <input type="text" name="description" id="description" value="${description}"><br/>
  <label for="price">List Price :</label>
  <input type="number" name="price" id="price" value="${price}"><br/>
  <label for="discount">Discount Percent :</label>
  <input type="number" name="discount" id="discount" value="${discount}"><br/>
  <button type="submit" class="btn btn-primary">Calculate Discount</button>
</form>
${result}

</body>
</html>