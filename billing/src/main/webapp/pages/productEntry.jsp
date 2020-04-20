<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product Entry</title>


<link rel="stylesheet" type="text/css" href="/pages/bootstrap.min.css">
<style>
body { background-color: #e3e6e4; }
a { color: white; }
</style>
</head>

<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>
<body ng-app="myApp" ng-controller="myCtrl">


<div style="border-style:solid;border-width:1px;border-color:black;">
<center><h3>Product Page</h3></center>
</div>
<div>
<center>
<button type="button" class="btn btn-success btn-sm"><a href="/">Home page</a></button>
<button type="button" class="btn btn-success btn-sm"><a href="billing">Billing page</a></button>
</center>
</div>


<div style="border-style:solid;border-width:1px;border-color:black;height: 150px;">
		<center><h5>Add Product</h5></center>
		
		<form action="productEntry">
		<div class="row">
    		<div class="col">
		
		<label for="product_code">Product Code:</label>
		<input type="text" id="product_code" name="product_code" placeholder="Enter code (INT)" required>
		</div>
		
		<div class="col">
		<label for="product_name">Product Name:</label>
		<input type="text" id="product_name" name="product_name" placeholder="Enter name (STRING)" required>
		</div>
		
		<div class="col">
		<label for="product_price">Product Price:</label>
		<input type="text" id="product_price" name="product_price" placeholder="Enter price (FLOAT)" required>
		</div>
		
		<div class="col">
		<label for="product_gst">Product GST:</label>
		<input type="text" id="product_gst" name="product_gst" placeholder="Enter gst (FLOAT)" required>
		</div>
		</div>
		<br>
		
		<center><input type="submit" value="Add Product"  class="btn btn-primary"></center>
		</form>
</div>


<div class="partition2">
<script>
function look(){

            		//var element=document.getElementById('product_code');
            		var repo=(${obj});

            		var edit_code = document.getElementById('code').value;
            	//	var item_name=document.getElementById('item_name');
            		//var str=item_name.localeCompare(repo[1].product_name);
            		//console.log(str);
            		
            		var pos=0; 
            		var i;
            		/*	
            		console.log("A"+repo);
            		console.log("B"+repo[1].product_code);
            		console.log("C"+product_code);
            		*/
            		for(i=0;i<repo.length;i++){
						
						if(repo[i].product_code==edit_code)
							{
							
							pos=i;
							break;
							}
						
						
                	}
					//console.log(repo[i].product_code);
					if(repo[i].product_code==0){
						document.getElementById('edit_code').value="";
	                    document.getElementById('edit_name').value="";
	                    document.getElementById('edit_price').value="";
	                    document.getElementById('edit_gst').value="";
						}
					else{
						
            		document.getElementById('edit_code').value=repo[i].product_code;
                    document.getElementById('edit_name').value=repo[i].product_name;
                    document.getElementById('edit_price').value=repo[i].product_price;
                    document.getElementById('edit_gst').value=repo[i].product_gst;
					}

					document.getElementById('code').value="";
            		
                }
            
</script>
<div class="float-left"style="border-style:solid;border-width:1px;border-color:black;height: 190px; width: 300px;">
		<center><h5>Search to Edit Product</h5></center>
		
		<center>
		
		<label for="code">Product Code:</label><br>
		<input type="text" id="code" name="code" placeholder="Enter product code" required>
			
		
		<br><br>
		
		<button onclick="look();" class="btn btn-primary">Search Item</button><br/><br/>	
		</center>
</div>
		
<div style="border-style:solid;border-width:1px;border-color:black; height:30px">
		<center><h5>Edit details (Product code: fixed)</h5></center>
		<form action="productEntry">
		<center>
		<div class="row">
    		
    	<div class="col">
		<label for="product_code">Product Code:</label><br>
		<input type="text" id="edit_code" name="product_code" required readonly>
		</div>
		
		<div class="col">
		<label for="product_name">Product Name:</label><br>
		<input type="text" id="edit_name" name="product_name" required>
		</div>
		
		<div class="col">
		<label for="product_price">Product Price</label><br>
		<input type="text" id="edit_price" name="product_price" required>
		</div>
		
		<div class="col">
		<label for="product_gst">Product GST:</label><br>
		<input type="text" id="edit_gst" name="product_gst" required>
		</div>
		</div>
		
		<br>
	
		<input type="submit" value="Modify" class="btn btn-primary">
	</center>
		</form>
		
		
		
</div>

</div>




<div style="clear:both;border-top: 1px solid black">
<script>

var result=${obj}



//delete result[0];



</script>
<center>
<h2>Product entry</h2>
<table ng-controller="myCtrl" border="1">

	<tr>
          <th>Product Code</th>
          <th>Product Name</th>
          <th>Product Price</th>
          <th>Product GST %</th>
    </tr>
    <tr ng-repeat="x in records">
        <td>{{x.product_code}}</td>
        <td>{{x.product_name}}</td>
        <td>{{x.product_price}}</td>
        <td>{{x.product_gst}}</td>
    </tr>
</table>
</center>
<script>
var app = angular.module("myApp", []);
app.controller("myCtrl", function($scope) {
    $scope.records = result;
});
</script>
</div>





<script src="/pages/bootstrap.min.js"></script>

</body>
</html>