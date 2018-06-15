$('#link-to-cart').html("<%= j(link_to_cart) %>")
$('#link-to-cart1').html("<%= j(link_to_cart) %>")
$(document).ready(function() {
      var x = document.getElementById("snackbar");
      x.className = "show";
      setTimeout(function(){ x.className = x.className.replace("show", ""); }, 1000);
});
