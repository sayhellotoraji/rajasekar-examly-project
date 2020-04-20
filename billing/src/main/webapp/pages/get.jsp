<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product Entry</title>
</head>

<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>

<body>



<a href="index">Home</a>
<a href="billing">Billing page</a>
<div>
		<h2>Add Product:</h2>
		
		<form action="productEntry">
		
		<label for="product_code">Product Code:</label><br>
		
		
		<label for="product_name">Product Name:</label><br>
		<input type="text" id="product_name" name="product_name" required><br>
		
		<label for="product_price">Product Price</label><br>
		<input type="text" id="product_price" name="product_price" required><br>
		
		<label for="product_gst">Product GST:</label><br>
		<input type="text" id="product_gst" name="product_gst" required><br>
		<br>
		
		<input type="submit" value="Submit">
		</form>
</div>


<div>

<h2>Product entry</h2>
<p id="rec">$({List<Product>)obj}</p>

<p id="demo"></p>



</div>
<script>
var txt = document.getElementById("rec");
var obj = JSON.parse(txt);
document.getElementById("demo").innerHTML = obj.name + ", " + obj.age;
</script>


<div>

</div>
</body>
</html>