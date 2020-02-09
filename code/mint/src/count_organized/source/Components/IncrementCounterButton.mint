component IncrementCounterButton {

  connect Counter.Store exposing {
    increment as incrementCounter
  }

  fun handleIncrement (event : Html.Event) : Promise(Never, Void) {
    incrementCounter()
  }

  fun render : Html {
    <button class="button is-medium is-success" onClick={handleIncrement}>
      <i class="fas fa-plus"></i>
    </button>
  }
}
