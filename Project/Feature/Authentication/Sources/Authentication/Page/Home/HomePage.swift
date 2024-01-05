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
    Text("Home Page")
//    VStack {
//      Text("홈페이지")
//        .font(.largeTitle)
//
//      Spacer()
//
//      Text("로그인 성공!")
//        .font(.title)
//
//      VStack(alignment: .leading, spacing: 8) {
//        Text("Uid: \(viewStore.state.item.uid)")
//        Text("Email: \(viewStore.state.item.email ?? "")")
//        Text("Photo URL : \(viewStore.state.item.photoURL ?? "Don't have an photo item")")
//      }
//      .padding()
//      .clipShape(RoundedRectangle(cornerRadius: 10))
//      .overlay(
//        RoundedRectangle(cornerRadius: 10)
//          .stroke(lineWidth: 1))
//
//      Button(action: { viewStore.send(.onTapSignOut) }) {
//        Text("Sign Out")
//      }
//      .padding(.top, 24)
//
//      Spacer()
//    }
//    .onAppear {
//      viewStore.send(.getUserInfo)
//    }
//    .padding(.top, 64)
//    .padding()
//    .navigationBarBackButtonHidden(true)
//    .toolbar(.hidden, for: .navigationBar)
  }
}
