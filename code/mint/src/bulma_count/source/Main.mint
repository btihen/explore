component Main {

  style centerall {
    justify-content: center;
    display: flex;
    height: 100vh;
    width: 100vw;
  }

  fun render : Html {
    <div::centerall class="container is-fluid">
      <Counter/>
    </div>
  }

}