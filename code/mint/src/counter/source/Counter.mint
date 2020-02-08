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
    background: #009c00;
  }

  style count {
    margin: 0 7px 0;
  }

  fun handleClickOnDecrement (event : Html.Event) : Promise(Never, Void) {
    decrementCounter()
    Debug.log("decrement")
  }

  fun handleClickOnIncrement (event : Html.Event) : Promise(Never, Void) {
    incrementCounter()
    Debug.log("increment")
  }

  fun render : Html {
    <div::counter>
      <button::counterButton::decrementButton
        onClick={handleClickOnDecrement}>
        "-"
      </button>

      <div::count>
        <{"Here's the count: #{count}"}>
      </div>

      <button::counterButton::incrementButton
        onClick={handleClickOnIncrement}>
        "+"
      </button>
    </div>
  }
}
