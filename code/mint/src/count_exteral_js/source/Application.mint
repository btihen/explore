enum Page {
  Home
  Count
  Named
  NotFound
}

store Application {
  state page : Page = Page::Home
  state route : String = "/"

  fun initialize : Promise(Never, Void) {
    sequence {
      Http.abortAll()
    }
  }

  fun setPage (page : Page) : Promise(Never, Void) {
    next { page = page }
  }

  fun setRoute (slug : String) : Promise(Never, Void) {
    next { route = slug }
  }
}
