import Architecture
import ComposableArchitecture
import SwiftUI

// MARK: - HomePage

struct HomePage {
  private let store: StoreOf<HomeStore>
  @ObservedObject private var viewStore: ViewStoreOf<HomeStore>

  init(store: StoreOf<HomeStore>) {
    self.store = store
    viewStore = ViewStore(store, observe: { $0 })
  }
}

extension HomePage { }

// MARK: View

extension HomePage: View {
  var body: some View {
    VStack {
      Text("Home Page")
    }
    .onAppear {
      viewStore.send(.getUser)
    }
    .onDisappear {
      viewStore.send(.teardown)
    }
    
  }
}
