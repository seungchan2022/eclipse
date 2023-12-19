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
        .font(.largeTitle)
      
      Spacer()
            
      Button(action: { viewStore.send(.onTapSignOut) }) {
        Text("Sign Out")
      }
      .padding(.top, 24)
      
      Spacer()
    }
    .padding()
    .navigationBarBackButtonHidden(true)
  }
}
