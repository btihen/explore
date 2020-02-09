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

  fun render : Html {
    <div::counter>
      <nav class="panel">
        <p class="panel-heading">
          <{ "Path: #{routeName}" }>
        </p>
        <p class="panel-tabs">
          <a>
            <DecrementCounterButton/>
          </a>
          <a>
            <CounterText/>
          </a>
          <a>
            <IncrementCounterButton/>
          </a>
        </p>
      </nav>
    </div>
  }
}
