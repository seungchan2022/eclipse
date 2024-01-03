import Architecture
import ComposableArchitecture
import Domain
import GoogleSignIn
import GoogleSignInSwift
import SwiftUI

// MARK: - SignInPage

struct SignInPage {
  private let store: StoreOf<SignInStore>
  @ObservedObject private var viewStore: ViewStoreOf<SignInStore>

  init(store: StoreOf<SignInStore>) {
    self.store = store
    viewStore = ViewStore(store, observe: { $0 })
  }
}

extension SignInPage { }

// MARK: View

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

      Button(action: { viewStore.send(.onTapSignInEmail) }) {
        Text("로그인")
      }
      .padding(.top, 24)

      GoogleSignInButton(viewModel: GoogleSignInButtonViewModel(scheme: .dark, style: .wide, state: .normal)) {
        viewStore.send(.onTapSignInGoogle)
      }

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
    .padding(.top, 64)
    .padding()
    .navigationBarBackButtonHidden(true)
    .toolbar(.hidden, for: .navigationBar)
  }
}

// #Preview(body: {
//  SignInPage(store: .init(
//    initialState: SignInStore.State(injectionItem: .init(content: "", password: "")),
//    reducer: {
//      SignInStore(env: .init(
//        useCaseGroup: AuthenticationEnvironmentUseable, navigator: ))
//    }))
// })
