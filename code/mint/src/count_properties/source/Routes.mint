routes {
  / {
    Application.setPage(Page::Home)
  }

  /counter {
    Application.setPage(Page::Count)
  }

  /counter/:slug (slug: String) {
    sequence {
      Application.setPage(Page::Named)
      Application.setRoute(slug)
    }
  }

  * {
    Application.setPage(Page::NotFound)
  }
}