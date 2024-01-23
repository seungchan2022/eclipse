import Architecture
import Domain
import ComposableArchitecture
import SwiftUI
import DesignSystem

struct PlusPage {
  private let store: StoreOf<PlusStore>
  @ObservedObject private var viewStore: ViewStoreOf<PlusStore>
  
  init(store: StoreOf<PlusStore>) {
    self.store = store
    self.viewStore = ViewStore(store, observe: { $0 })
  }
}

extension PlusPage { }

extension PlusPage: View {
  var body: some View {
    Text("12")
  }
}
