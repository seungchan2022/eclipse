import SwiftUI
import Architecture
import ComposableArchitecture

struct HomePage {
  private let store: StoreOf<HomeStore>
  @ObservedObject private var viewStore: ViewStoreOf<HomeStore>
  
  init(store: StoreOf<HomeStore>) {
    self.store = store
    self.viewStore = ViewStore(store, observe: { $0 })
  }
}

extension HomePage {
  
}

extension HomePage: View {
  var body: some View {
    VStack {
      Text("홈페이지")
      
      Button(action: { }) {
        Text("Sign Out")
      }
    }
  }
}
