$(function(){
  $(".sell-price").on('keyup', function(e){
    e.preventDefault();
    let number = $(".price-input").val();
    let tax = Math.round(number * 0.1)
    let subtraction = number - tax;
    let tax2 = tax.toLocaleString();
    let subtraction2 = subtraction.toLocaleString();
    $("#add-tax-price").text(tax2);
    $("#profit").text(subtraction2);
    });
  });
  