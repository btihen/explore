/* Counter.mint */

component Counter {

  style counter {
    display: flex;
  }

  style counterButton {
    color: white;
    border: 0;
    margin: 0 7px 0;
    font-size: 18px;
    font-weight: bold;
  }

  style decrementButton {
    background: red;
  }

  style incrementButton {
    background: lime;
  }

  style counterText {
    font-size: 36px;
    margin: 0 7px 0;
  }

  state counter : Number = 0

  fun increment : Promise(Never, Void) {
    next { counter = counter + 1 }
  }

  fun decrement : Promise(Never, Void) {
    next { counter = counter - 1 }
  }

  fun countHtml (count : Number) : Html {
    <div::counterText>
      <{"Count is: #{count}"}>
    </div>
  }

  fun render : Html {
    <div::counter>
      <button::counterButton::decrementButton
        onClick={decrement}>
        "-"
      </button>

      <{ countHtml(counter) }>

      <button::counterButton::incrementButton
        onClick={increment}>
        "+"
      </button>
    </div>
  }
}