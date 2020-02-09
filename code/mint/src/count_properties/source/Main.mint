component Main {
  
  connect Application exposing { page, route }

  style base {
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
    <div::base>
      case (page) {
        Page::Home => 
          <Counter/>

        Page::Count => 
          <Counter routeName="/counter"/>

        Page::Named => 
          <Counter routeName={"/counter/#{route}"}/>

        Page::NotFound =>
          <div>
            "Page NOT Found"
          </div>
      }
    </div>
  }
}