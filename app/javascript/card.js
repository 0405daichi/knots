const pay = () => {
  Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  const form = document.getElementById("charge-form");
  form.addEventListener("submit", (e) => {
    e.preventDefault();
    
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);

    const card = {
      number: formData.get("comment_donation[number]"),
      cvc: formData.get("comment_donation[cvc]"),
      exp_month: formData.get("comment_donation[exp_month]"),
      exp_year: `20${formData.get("comment_donation[exp_year]")}`,
    };

    Payjp.createToken(card, (status, response) => {
      if (status == 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} name='token' type="hidden">`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);
      }

      document.getElementById("comment_donation[number]")
      document.getElementById("comment_donation[cvc]")
      document.getElementById("comment_donation[exp_month]")
      document.getElementById("comment_donation[exp_year]")

      document.getElementById("charge-form").submit();
    });
  });
};

window.addEventListener("load", pay);