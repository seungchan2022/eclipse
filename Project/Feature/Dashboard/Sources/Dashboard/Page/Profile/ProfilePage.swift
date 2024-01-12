import Architecture
import ComposableArchitecture
import SwiftUI

struct ProfilePage {
  private let store: StoreOf<ProfileStore>
  @ObservedObject private var viewStore: ViewStoreOf<ProfileStore>
  
  init(store: StoreOf<ProfileStore>) {
    self.store = store
    self.viewStore = ViewStore(store, observe: { $0 })
  }
  
}

extension ProfilePage { }

extension ProfilePage: View {
  var body: some View {
    Text("profile page")
  }
}
