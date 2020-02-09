component CounterText {

  connect Counter.Store exposing {
    count
  }

  fun render : Html {
    <p class="title is-3">
      <{ "Count: #{count}" }>
    </p>
  }
}
