import Architecture
import ComposableArchitecture
import SwiftUI

// MARK: - MePage

struct MePage {
  private let store: StoreOf<MeStore>
  @ObservedObject private var viewStore: ViewStoreOf<MeStore>

  init(store: StoreOf<MeStore>) {
    self.store = store
    viewStore = ViewStore(store, observe: { $0 })
  }
}

extension MePage { }

// MARK: View

extension MePage: View {
  var body: some View {
    VStack {
      Text("홈페이지")
        .font(.largeTitle)

      Spacer()

      Text("로그인 성공!")
        .font(.title)

      VStack(alignment: .leading, spacing: 8) {
        Text("Uid: \(viewStore.state.item.uid)")
        Text("Email: \(viewStore.state.item.email ?? "")")
        Text("Photo URL : \(viewStore.state.item.photoURL ?? "Don't have an photo item")")
      }
      .padding()
      .clipShape(RoundedRectangle(cornerRadius: 10))
      .overlay(
        RoundedRectangle(cornerRadius: 10)
          .stroke(lineWidth: 1))

      Button(action: { viewStore.send(.onTapSignOut) }) {
        Text("Sign Out")
      }
      .padding(.top, 24)

      Spacer()
    }
    .onAppear {
      viewStore.send(.getUserInfo)
    }
    .padding(.top, 64)
    .padding()
    .navigationBarBackButtonHidden(true)
    .toolbar(.hidden, for: .navigationBar)
  }
}
