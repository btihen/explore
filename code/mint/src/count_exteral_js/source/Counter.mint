component Counter {

  style counter {
    /* set panel size */
    max-width: 300px;
    min-width: 300px;
    /* horizontal center */
    margin-left: auto;
    margin-right: auto;
  }

  property routeName : String = "/"

  connect Counter.Store exposing {
    count,
    decrement as decrementCounter,
    increment as incrementCounter
  }

  fun handleDecrement (event : Html.Event) : Promise(Never, Void) {
    decrementCounter()
  }

  fun handleIncrement (event : Html.Event) : Promise(Never, Void) {
    incrementCounter()
  }

  fun decrementButton : Html {
    <button class="button is-medium is-warning" onClick={handleDecrement}>
      <i class="fas fa-minus"></i>
    </button>
  }

  fun counterTextHtml : Html {
    <p class="title is-3">
      <{ "Count: #{count}" }>
    </p>
  }

  fun incrementButton : Html {
    <button class="button is-medium is-success" onClick={handleIncrement}>
      <i class="fas fa-plus"></i>
    </button>
  }

  fun render : Html {
    <div::counter>
      <nav class="panel">
        <p class="panel-heading">
          <{ "Path: #{routeName}" }>
        </p>
        <p class="panel-tabs">
          <a>
            <{ decrementButton() }>
          </a>
          <a>
            <{ counterTextHtml() }> 
          </a>
          <a>
            <{ incrementButton() }>
          </a>
        </p>
      </nav>
    </div>
  }
}
