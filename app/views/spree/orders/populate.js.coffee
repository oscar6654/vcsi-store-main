$('#link-to-cart').html("<%= j(link_to_cart) %>")
$('#link-to-cart1').html("<%= j(link_to_cart) %>")


$(document).ready(function(){
  // $.mdtoast('This is a toast message.'); // Initializes and shows default toast
  var name = document.getElementsByClassName("product-title")[0].innerText
  var quantity = document.getElementById("quantity").value
  var variant_id = document.querySelector('input[name="variant_id"]:checked') || {id:''};
    console.log(label);
  if (variant_id.id !== "") {
    var label = document.querySelector(`label[for=${variant_id.id}]`).innerText;
    if (label.includes("ITEM")){
      var variant = label.slice(5, );
    } else {
      var variant = label.slice(5, );
    }
  } else{
    var variant = '';
  }

  $.mdtoast(`${name} ${variant} (${quantity}) Added`, { interactionTimeout: 2000, interaction: true, modal: true, type: $.mdtoast.type.SUCCESS });
});
