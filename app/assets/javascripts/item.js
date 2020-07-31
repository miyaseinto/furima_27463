$(function(){
  $(".sell-price").on('keyup', function(e){
    e.preventDefault();
    let number = $(".price-input").val();
    if( 300 <= number && number <= 9999999){
    let tax = Math.round(number * 0.1)
    let subtraction = number - tax;
    let tax2 = tax.toLocaleString();
    let subtraction2 = subtraction.toLocaleString();
    $("#add-tax-price").text(tax2);
    $("#profit").text(subtraction2);
    }else{
    $("#add-tax-price").text("半角数字のみ入力可能");
    $("#profit").text("半角数字のみ入力可能");
    }
    });
  });
  