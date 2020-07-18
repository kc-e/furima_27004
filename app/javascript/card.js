window.addEventListener("DOMContentLoaded", () => {
  console.log("test")
  let purchase_button = $(".buy-red-btn");
  const form = document.getElementById('charge-form');
  console.log(form)
  form.addEventListener("submit", (e)=> {
    console.log("check")
    e.preventDefault();
  // Payjp.setPublicKey(process.env.PAYJP_PUBLIC_KEY);
  Payjp.setPublicKey('pk_test_2d43a0765d31e8009075b356');
  
    const formResult = document.getElementById("charge-form");
    const formData = new FormData(formResult);
 
    let now = new Date();

    let card = {
      number: $("#number").val(),
      cvc: $("#cvc").val(),
      exp_month: $("#exp_month").val(),
      exp_year: Number($("#exp_year").val()) + Math.round(now.getFullYear() / 100) * 100 //下②桁ではなく実際の年数を送る必要がある。
      };
      
    Payjp.createToken(card, (status, response) => {
      console.log("pay")
      if (status === 200) {
        const token = response.id;
        const renderDom = document.getElementById("charge-form");
        const tokenObj = `<input value=${token} type="hidden" name='token'>`;
        renderDom.insertAdjacentHTML("beforeend", tokenObj);

        document.getElementById("number").removeAttribute("name");
        document.getElementById("cvc").removeAttribute("name");
        document.getElementById("exp_month").removeAttribute("name");
        document.getElementById("exp_year").removeAttribute("name");

        document.getElementById("charge-form").submit();
        document.getElementById("charge-form").reset();

        $("#card_token").append(
          $('<input type="hidden" name="token">').val(response.id)
        );

        let form = $('#charge-form')[0];
        // ↓formのsubmitボタンを強制起動する（ページが遷移してコントローラが起動する）。
        form.submit();

      } else {
      }
    });

  });
});
  
  