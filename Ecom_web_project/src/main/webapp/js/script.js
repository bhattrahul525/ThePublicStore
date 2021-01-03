
function add_to_cart(pid,pname,price){
	let cart = localStorage.getItem("cart");
	if (cart==null){
		let products = [];
		let product = {productId :pid, productName :pname, productQuantity:1,productPrice :price}
		products.push(product);
		localStorage.setItem("cart",JSON.stringify(products));
		//console.log("Product quantity is added for the first time")
		showToast("Item is added to cart");
		
	}
	else{
		let pcart =JSON.parse(cart);
		
		let oldProduct = pcart.find((item)=>item.productId == pid)
		
		if(oldProduct){
			oldProduct.productQuantity = oldProduct.productQuantity+1
			pcart.map((item)=>{
				if(item.productId == oldProduct.productId){
					item.productQuantity = oldProduct.productQuantity
				}
				
			})
			localStorage.setItem("cart",JSON.stringify(pcart));
//			console.log("Product quantity is increased!!")
			showToast(oldProduct.productName + " quantity is increased");

		}
		else{
			let product = {productId :pid, productName :pname, productQuantity:1,productPrice :price}
			pcart.push(product);
			localStorage.setItem("cart",JSON.stringify(pcart));
			console.log("Product quantity is added!!")
			showToast("Product quantity is added to cart");

		}
	}
	updateCart();
}


function updateCart(){
	let cartString=localStorage.getItem("cart");
	let cart=JSON.parse(cartString);
	if(cart==null || cart.length==0){
		
		console.log("Cart is empty!!");
		$(".cart-items").html("( 0 )");
		$(".cart-body").html("<h3>The cart doesnt have any item</h3>");
		$(".checkout-btn").attr("disabled",true)
	}
	else{
		console.log(cart);
		$(".cart-items").html(`(${cart.length})`);
		
		let table=`
			<table class='table'>
			<thead class='thead-light'>
				<tr>
					<th>Item Name</th>
					<th>Price</th>
					<th>Quantity</th>
					<th>Total Price</th>
					<th>Action</th>
				</tr>
			</thead>
			
			
			`;
			let totalPrice=0
			cart.map((item)=>{
				
				table+=`
					<tr>
						<td> ${item.productName} </td>
						<td> ${item.productPrice} </td>
						<td> ${item.productQuantity} </td>
						<td> ${item.productQuantity * item.productPrice}</td>
						<td> <button class='btn btn-danger btn-sm' onclick='deleteItemFromCart(${item.productId})'>Remove</button></td>
						
						
					</tr>`
					totalPrice+=item.productPrice * item.productQuantity;
					
			})
		
			table=table+
			`
			<tr>
			<td colspan='5' class='text-right font-weight-bold m-5'> Total Price : ${totalPrice}</td>
			</tr>
			</table>`
			$(".cart-body").html(table);
			$(".checkout-btn").attr("disabled",false)
			
			
			
	}
}

function deleteItemFromCart(pid)
{
	let cart = JSON.parse(localStorage.getItem('cart'));
	 
	let newcart=cart.filter((item) => item.productId != pid)
	
	localStorage.setItem('cart',JSON.stringify(newcart))

	updateCart();
	
	showToast("Item is removed from cart")

}

function showToast(content) {
	$("#toast").addClass("display");
	$("#toast").html(content);
   
   setTimeout(() => { 
	   $("#toast").removeClass("display");
	   },3000);
}

function deleteCart(){
	
	`<%
	for(Product p:list){
	
	pid=p.getpid;
	%>`
	let cart = JSON.parse(localStorage.getItem('cart'));
	 
	let newcart=cart.filter((item) => item.productId != pid)
	
	localStorage.setItem('cart',JSON.stringify(newcart))
	
	`<% 
	}  
	%>`
	updateCart();
	
	
}

$(document).ready(function(){
	updateCart();
})

function goToCheckout(){
	window.location="checkout.jsp"
}
