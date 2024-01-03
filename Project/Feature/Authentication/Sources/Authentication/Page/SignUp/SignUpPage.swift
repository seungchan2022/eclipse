import Architecture
import ComposableArchitecture
import SwiftUI

// MARK: - SignUpPage

struct SignUpPage {
  private let store: StoreOf<SignUpStore>
  @ObservedObject private var viewStore: ViewStoreOf<SignUpStore>

  init(store: StoreOf<SignUpStore>) {
    self.store = store
    viewStore = ViewStore(store, observe: { $0 })
  }
}

extension SignUpPage { }

// MARK: View

extension SignUpPage: View {
  var body: some View {
    VStack {
      Text("Sign Up Page")
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

      Button(action: { viewStore.send(.onTapSignUp) }) {
        Text("회원 가입")
      }
      .padding(.top, 24)

      Spacer()

      Button(action: { viewStore.send(.routeToSignIn) }) {
        HStack {
          Text("Already have an account?")

          Text("Sign In here")
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
