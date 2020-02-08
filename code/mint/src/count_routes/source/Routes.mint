routes {
  / {
    Application.setPage(Page::Home)
  }

  /counter {
    Application.setPage(Page::Count)
  }

  * {
    Application.setPage(Page::NotFound)
  }
}