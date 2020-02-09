component Content {
  property children : Array(Html) = []

  fun render : Html {
    <section class="section">
      <div class="container is-fluid">
        <{ children }>
      </div>
    </section>
  }
}
