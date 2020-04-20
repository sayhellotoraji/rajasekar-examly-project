<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Billing</title>


<link rel="stylesheet" type="text/css" href="/pages/bootstrap.min.css">

<style>
body { background-color: #e3e6e4; }
a { color: white; }
#hid {
  visibility: hidden;
}
</style>
</head>

 <script>
            
            function addRow()
            {
                // get input values
                  var code = document.getElementById('code').value;
                  var name = document.getElementById('product_name').value;
                  var price = document.getElementById('product_price').value;
                  var gst = document.getElementById('product_gst').value;
                  var quantity = document.getElementById('quantity').value;
                  
                  var estimate = (price*gst/100);
                  var amount=(parseFloat(estimate)+parseFloat(price))*quantity;

                  
                  total=parseFloat(total)+parseFloat(amount);
                  items=parseFloat(items)+parseFloat(quantity);

                  document.getElementById("total").innerHTML=total.toFixed(2);
                  document.getElementById("items").innerHTML=items;
                  //console.log(amount);
                  
                  // get the html table
                  // 0 = the first table
                  var table = document.getElementsByTagName('table')[0];
                  
                  // add new empty row to the table
                  // 0 = in the top 
                  // table.rows.length = the end
                  // table.rows.length/2+1 = the center
                  var newRow = table.insertRow(table.rows.length);
                  
                  // add cells to the row
                  var cel1 = newRow.insertCell(0);
                  var cel2 = newRow.insertCell(1);
                  var cel3 = newRow.insertCell(2);
                  var cel4 = newRow.insertCell(3);
                  var cel5 = newRow.insertCell(4);
                  var cel6 = newRow.insertCell(5);
                  
                  // add values to the cells
                  cel1.innerHTML = code;
                  cel2.innerHTML = name;
                  cel3.innerHTML = price;
                  cel4.innerHTML = gst;
                  cel5.innerHTML = quantity;
                  cel6.innerHTML = amount.toFixed(2);

                  document.getElementById('code').value="";
                  document.getElementById('product_name').value="";
                  document.getElementById('product_price').value="";
                  document.getElementById('product_gst').value="";
                  document.getElementById('quantity').value="";
            }


            function look(){

            		//var element=document.getElementById('product_code');
            		var repo=(${search});

            		var product_code = document.getElementById('product_code').value;
            		
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
						
						if((repo[i].product_code==product_code)||(repo[i].product_name.valueOf()==product_code.valueOf()))
							{
							
							pos=i;
							break;
							}
						
						
                	}

            		document.getElementById('code').value=repo[i].product_code;
                    document.getElementById('product_name').value=repo[i].product_name;
                    document.getElementById('product_price').value=repo[i].product_price;
                    document.getElementById('product_gst').value=repo[i].product_gst;

                    document.getElementById('product_code').value="";
					/* String equality
                    console.log("helllll"+repo[i].product_name.valueOf());
                    console.log(product_code.valueOf());
                    console.log(repo[i].product_code==product_code);
            		console.log(repo[i].product_name.valueOf()==product_code.valueOf());
            		*/
                }
            
        </script>
        
        

<body>
<div style="border-style:solid;border-width:1px;border-color:black;">
<center><h3>Billing Page</h3></center>
</div>

<div style="border-style:solid;border-width:1px;border-color:black;">
<center>
<button type="button" class="btn btn-success btn-sm"><a href="/">Home page</a></button>
<button type="button" class="btn btn-success btn-sm"><a href="productEntry">Product Page</a></button>
</center>
</div>


<div class="float-left" style="border-style:solid;border-width:1px;border-color:black; height: 230px; width:200px">
		<center><h5>Search Product:</h5>
		
		<br>
		
		<label for="product_code">Product Code/ Name:</label><br>
		<input type="text" id="product_code" name="product_code" placeholder="Enter code/ name" required ><br>

		
		<br>
		
		<button onclick="look();" class="btn btn-primary">Search Item</button><br/><br/>
		</center>
		
</div>



<center>
<h5>Product Details:</h5>
	<div class="row">
    		
    	<div class="col">
        <p>Product Code  		: </p><input type="text" name="code" id="code" readonly/><br/><br/>
        </div>
        
        <div class="col">
        <p>Product Name  		: </p><input type="text" name="product_name" id="product_name" readonly/><br/><br/>
        </div>
        
        <div class="col">
        <p>Product Price 		: </p><input type="text" name="product_price" id="product_price" readonly/><br/><br/>
        </div>
     </div>
     
 </center>
 
 
 <center>       
    <div class="row">   
        <div class="col">
        <p>Product GST  		: </p><input type="text" name="product_gst" id="product_gst" readonly/><br/><br/>
        </div>
        
        <div class="col">
        <p>Product Quantity  	: </p><input type="text" name="quantity" id="quantity" placeholder="Enter qty after search"required/><br/><br/>
       	</div>
    
    	<div class="col">
    	<p></p>
    	
       	<button onclick="addRow();"class="btn btn-primary">Add to Billing</button><br/><br/>
       	</div>
    </div>
    
</center>


<div style="clear:both;border-top: 1px solid black">
<center>

<h3>Billing section</h3>
<p><h4>No of items:		<span id="items"></span><span id="hid">************************</span>Total:	<span id="total"></span></h4></p>
        <table border="1">
            
            <tr>
                <th>Product Code</th>
                <th>Product Name</th>
                <th>Product Price</th>
                <th>Product GST</th>
                <th>Product Quantity</th>
                <th>Amount</th>
            </tr>
            
            
            
        </table>
        
</center>
        <script>
        var total=0;
        var items=0;
        </script>
            
            
</div>


<script src="/pages/bootstrap.min.js"></script>

</body>
</html>