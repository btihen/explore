/* CounterStore.mint */

store Counter.Store {
  state count : Number = 0

  fun increment : Promise(Never, Void) {
    next { count = count + 1 }
  }

  fun decrement : Promise(Never, Void) {
    next { count = count - 1 }
  }
}
