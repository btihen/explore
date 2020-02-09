component DecrementCounterButton {

  connect Counter.Store exposing {
    decrement as decrementCounter
  }

  fun handleDecrement (event : Html.Event) : Promise(Never, Void) {
    decrementCounter()
  }

  fun render : Html {
    <button class="button is-medium is-warning" onClick={handleDecrement}>
      <i class="fas fa-minus"></i>
    </button>
  }
}
