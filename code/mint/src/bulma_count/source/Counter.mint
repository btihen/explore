/* Counter.mint */

component Counter {
  connect Counter.Store exposing {
    count,
    increment as incrementCounter,
    decrement as decrementCounter
  }

  fun handleClickOnDecrement (event : Html.Event) : Promise(Never, Void) {
    decrementCounter()
  }

  fun handleClickOnIncrement (event : Html.Event) : Promise(Never, Void) {
    incrementCounter()
  }

  style count {
    padding-left: 10px;
    padding-right: 10px;
  }

  fun render : Html {
    <div class="columns is-centered is-desktop is-vcentered">
      <div class="column">
        <button class="button is-warning" onClick={handleClickOnDecrement}>
          <i class="fas fa-minus"></i>
        </button>

        <span::count class="title is-3">
          <{"Count: #{count}"}>
        </span>

        <button class="button is-success" onClick={handleClickOnIncrement}>
          <i class="fas fa-plus"></i>
        </button>
      </div>
    </div>
  }
}
