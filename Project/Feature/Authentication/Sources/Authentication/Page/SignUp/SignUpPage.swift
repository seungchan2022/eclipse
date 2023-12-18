import SwiftUI
import Architecture
import ComposableArchitecture

struct SignUpPage {
  private let store: StoreOf<SignUpStore>
  @ObservedObject private var viewStore: ViewStoreOf<SignUpStore>
  
  init(store: StoreOf<SignUpStore>) {
    self.store = store
    self.viewStore = ViewStore(store, observe: { $0 })
  }
  
}

extension SignUpPage {
  
}

extension SignUpPage: View {
  var body: some View {
    Text("회원 가입 페이지")
    
    Button(action: { }) {
      Text("Sign Up")
    }
  }
}
