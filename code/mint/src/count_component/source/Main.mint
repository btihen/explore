component Main {
  style base {
    font-family: sans;

    justify-content: center;
    align-items: center;
    display: flex;
    height: 100vh;
    width: 100vw;
  }

  fun render : Html {
    <div::base>
      <Counter/>
    </div>
  }
}