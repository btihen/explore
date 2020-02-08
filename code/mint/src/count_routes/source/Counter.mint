/* Counter.mint */

component Counter {

  property routeName : String = "/"

  connect Counter.Store exposing {
    count,
    increment as incrementCounter,
    decrement as decrementCounter
  }

  fun handleDecrement (event : Html.Event) : Promise(Never, Void) {
    decrementCounter()
  }

  fun handleIncrement (event : Html.Event) : Promise(Never, Void) {
    incrementCounter()
  }

  fun render : Html {
    <nav class="panel">
      <p class="panel-heading">
        <{ "Mint Counter" }>
      </p>
      <p class="panel-tabs">
        <a>
          <button class="button is-medium is-warning" onClick={handleDecrement}>
            <i class="fas fa-minus"></i>
          </button>
        </a>
        <a>
          <p class="title is-3">
            <{ "Count: #{count}" }>
          </p>
        </a>
        <a>
          <button class="button is-medium is-success" onClick={handleIncrement}>
            <i class="fas fa-plus"></i>
          </button>
        </a>
      </p>
    </nav>
  }
}
