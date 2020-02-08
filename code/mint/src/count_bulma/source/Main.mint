component Main {

  style centerAll {
    font-family: sans;
    font-weight: bold;
    font-size: 50px;

    justify-content: center;
    align-items: center;
    display: flex;
    height: 100vh;
    width: 100vw;
  }

  fun render : Html {
    <div::centerAll class="container is-fluid">
      <Counter/>
    </div>
  }

}