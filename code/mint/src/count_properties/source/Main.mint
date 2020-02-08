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
    case (page) {
      Page::Home => 
        <div::base>
          <Counter/>
        </div>

      Page::Count => 
        <div::base>
          <Counter routeName="/counter"/>
        </div>

      Page::Named => 
        <div::base>
          <Counter routeName={"/counter/#{route}"}/>
        </div>

      Page::NotFound =>
        <div::base>
          "Page NOT Found"
        </div>
    }
  }
}