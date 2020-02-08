component Main {
  style base {
    font-family: sans;
    font-weight: bold;
    font-size: 36px;

    justify-content: center;
    align-items: center;
    display: flex;
    height: 100vh;
    width: 100vw;
  }

  style red {
    background: red;
    font-family: sans;
    font-weight: bold;
    font-size: 24px;
  }

  style green {
    background: lime;
    font-family: sans;
    font-weight: bold;
    font-size: 24px;
  }

  state counter : Number = 0

  fun increment : Promise(Never, Void) {
    next { counter = counter + 1 }
  }

  fun decrement : Promise(Never, Void) {
    next { counter = counter - 1 }
  }

  fun countHtml (count : Number) : Html {
    <span>
      <{ "Count is: " + Number.toString(count) }>
    </span>
  }

  fun countString (count : Number) : String {
    "Count is: " + Number.toString(count)
  }

  fun render : Html {
    <div::base>
      <button::red onClick={decrement}>
        "-"
      </button>

      <{ countHtml(counter) }>

      <span>
        <{ countString(counter) }>
      </span>

      <span>
        <{ "Counter is: " + Number.toString(counter) }>
      </span>

      <button::green onClick={increment}>
        "+"
      </button>
    </div>
  }
}