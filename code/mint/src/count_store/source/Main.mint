component Main {
  style main {
    font-family: sans;

    justify-content: center;
    align-items: center;
    display: flex;
    height: 100vh;
    width: 100vw;
  }

  fun render : Html {
    <div::main>
      <Counter/>
    </div>
  }
}