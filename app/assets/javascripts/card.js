window.addEventListener('DOMContentLoaded', () => {
  const pay = () => {
    Payjp.setPublicKey("pk_test_f085bcee537ecca631c581b6");
    const form = document.getElementById("charge-form");
    form.addEventListener("submit", (e) => {
      e.preventDefault();

      const formResult = document.getElementById("charge-form");
      const formData = new FormData(formResult);

      const card = {
        number: formData.get("purchase_addresse[number]"),
        cvc: formData.get("purchase_addresse[cvc]"),
        exp_month: formData.get("purchase_addresse[exp_month]"),
        exp_year: `20${formData.get("purchase_addresse[exp_year]")}`,
      };
      Payjp.createToken(card, (status, response) => {
        if (status === 200) {
          const token = response.id;
          const renderDom = document.getElementById("charge-form");
          const tokenObj = `<input value=${token} type="hidden" name='token'>`;
          renderDom.insertAdjacentHTML("beforeend", tokenObj);

          document.getElementById("purchase_addresse_number").removeAttribute("name");
          document.getElementById("purchase_addresse_cvc").removeAttribute("name");
          document.getElementById("purchase_addresse_exp_month").removeAttribute("name");
          document.getElementById("purchase_addresse_exp_year").removeAttribute("name");
          document.getElementById("charge-form").submit();
          document.getElementById("charge-form").reset();
        } else {
        }
      });
    });
  };
  window.addEventListener("load", pay);
});

