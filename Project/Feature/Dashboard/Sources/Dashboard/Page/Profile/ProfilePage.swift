import Architecture
import ComposableArchitecture
import SwiftUI

// MARK: - ProfilePage

struct ProfilePage {
  private let store: StoreOf<ProfileStore>
  @ObservedObject private var viewStore: ViewStoreOf<ProfileStore>

  init(store: StoreOf<ProfileStore>) {
    self.store = store
    viewStore = ViewStore(store, observe: { $0 })
  }

}

extension ProfilePage { }

// MARK: View

extension ProfilePage: View {
  var body: some View {
    Text("profile page")
  }
}
