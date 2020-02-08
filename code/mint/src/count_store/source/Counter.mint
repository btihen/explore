/* Counter.mint */

component Counter {
  connect Counter.Store exposing {
    count,
    increment as incrementCounter,
    decrement as decrementCounter
  }

  style counter {
    display: flex;
  }

  style counterButton {
    color: white;
    border: 0;
    margin: 0 7px 0;
    font-size: 12px;
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

  fun handleDecrement (event : Html.Event) : Promise(Never, Void) {
    decrementCounter()
  }

  fun handleIncrement (event : Html.Event) : Promise(Never, Void) {
    incrementCounter()
  }

  fun render : Html {
    <div::counter>
      <button::counterButton::decrementButton
        onClick={handleDecrement}>
        "-"
      </button>

      <div::counterText>
        <{"Here's the count: #{count}"}>
      </div>

      <button::counterButton::incrementButton
        onClick={handleIncrement}>
        "+"
      </button>
    </div>
  }
}
