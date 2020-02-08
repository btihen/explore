enum Page {
  Home
  Count
  NotFound
}

store Application {
  state page : Page = Page::Home

  fun setPage (page : Page) : Promise(Never, Void) {
    next { page = page }
  }
}
