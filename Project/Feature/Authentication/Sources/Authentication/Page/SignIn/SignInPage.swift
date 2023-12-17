import ComposableArchitecture
import Domain
import SwiftUI

struct SignInPage {
  private let store: StoreOf<SignInStore>
  @ObservedObject private var viewStore: ViewStoreOf<SignInStore>
  
  init(store: StoreOf<SignInStore>) {
    self.store = store
    self.viewStore = ViewStore(store, observe: { $0 })
  }
}

extension SignInPage {
  
}

extension SignInPage: View {
  var body: some View {
    Text("Sign In Page")
    
    Button(action: { viewStore.send(.test) }) {
      Text("회원 가입")
    }
  }
}
