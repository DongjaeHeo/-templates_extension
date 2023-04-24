import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["form"];
  //set intervalID
  intervalID = null;
  connect() {
    // console.log("connected");
    // console.log(this.element);
    // let trix = document.querySelector("trix-editor div");
    // console.log(trix);

    // save every time the user type
    this.formTarget.addEventListener("keyup", (event) => {
      this.saveForm();
    });
    // this.formTarget.addEventListener("click", (event) => {
    //   this.saveForm();
    // });
    // const something = this;
    let trix = document.querySelector("trix-editor div");
    // console.log(trix.innerText);
    // save every 5 sec if there is any change in the form
    this.intervalID = setInterval(() => {
      let current = document.querySelector("trix-editor div");
      console.log(trix === current);
      // console.log(current.innerText)
      if (trix !== current) {
        // console.log(this);
        this.saveForm();
      }
      trix = current;
    }, 5000);
  }

  // when it's disconnected stop(clear) the interval
  disconnect() {
    console.log("disconnected");
    clearInterval(this.intervalID);
  }

  // sleep(milliseconds) {
  //   const date = Date.now();
  //   let currentDate = null;
  //   do {
  //     currentDate = Date.now();
  //   } while (currentDate - date < milliseconds);
  // }
  // submit the form
  saveForm() {
    // console.log(this.element);
    let trix = document.querySelector("#edit_template_19");
    // console.log(trix);
    trix.requestSubmit();
  }
}
