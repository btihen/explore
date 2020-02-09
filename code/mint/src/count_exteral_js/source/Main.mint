component Main {
  
  connect Application exposing { page, route }

  fun getPage(page : Page) : Html {
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
  }
 
  fun render : Html {
    <Layout>
      <{ getPage(page) }>
    </Layout>
  }
}