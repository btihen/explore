component Layout {
  property children : Array(Html) = []

  style base {
    height: 100vh;
    display: flex;
    background: white;
    flex-direction: column;
    justify-content: space-between;
  }

  fun render : Html {
    <div::base>
      <Header/>

      <Content>
        <{ children }>
      </Content>

      <Footer/>
    </div>
  }
}