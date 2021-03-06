component Header {

  fun render : Html {
    <nav class="navbar is-light" role="navigation" aria-label="main navigation">
      <div class="navbar-brand">
        <a class="navbar-item" href="/">
          <h1 id="title" class="navbar-item">
            <{ "Counter" }>
          </h1>
        </a>

        <a role="button" class="navbar-burger burger" aria-label="menu" 
                          aria-expanded="false" data-target="navbarCounter">
          <span aria-hidden="true"></span>
          <span aria-hidden="true"></span>
          <span aria-hidden="true"></span>
        </a>
      </div>

      <div id="navbarCounter" class="navbar-menu">
        <div class="navbar-start">

          <a class="navbar-item">
            <{ "Docs" }>
          </a>

          <div class="navbar-item has-dropdown is-hoverable">
            <a class="navbar-link">
              <{ "More" }>
            </a>

            <div class="navbar-dropdown">
              <a class="navbar-item">
                <{ "About" }>
              </a>
              <a class="navbar-item">
                <{ "Contact" }>
              </a>
              <hr class="navbar-divider"/>
              <a class="navbar-item">
                <{ "Report an issue" }>
              </a>
            </div>
          </div>
        </div>

        <div class="navbar-end">
          <div class="navbar-item">
            <div class="buttons">
              <a class="button is-primary">
                <strong><{ "Sign up" }></strong>
              </a>
              <a class="button is-light">
                <{ "Log in" }>
              </a>
            </div>
          </div>
        </div>
      </div>
    </nav>
  }
}
