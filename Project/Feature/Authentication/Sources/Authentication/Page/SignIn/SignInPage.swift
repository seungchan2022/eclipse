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
    VStack {
      Text("Sign In Page")
        .font(.largeTitle)
      
      Spacer()
      
      TextField(
        "",
        text: viewStore.$email,
        prompt: Text("Email"))
      .textInputAutocapitalization(.none)
      .padding()
      .background(.thinMaterial)
      .clipShape(RoundedRectangle(cornerRadius: 10))
      
      TextField(
        "",
        text: viewStore.$password,
        prompt: Text("Password"))
      .textInputAutocapitalization(.none)
      .padding()
      .background(.thinMaterial)
      .clipShape(RoundedRectangle(cornerRadius: 10))
            
      Button(action: { viewStore.send(.onTapSignIn) }) {
        Text("로그인")
      }
      .padding(.top, 24)
      
      Spacer()
      
      Button(action: { viewStore.send(.routeToSignUp) }) {
        HStack {
          Text("Don't have an account?")
          
          Text("Sign Up here")
            .fontWeight(.bold)
        }
      }
      
      Spacer()
    }
    .padding()
  }
}
