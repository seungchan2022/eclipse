import Architecture
import FirebaseAuth
import LinkNavigator
import SwiftUI

struct AppMain {
  let viewModel: AppViewModel
  @State private var isLoggendIn = false
}

extension AppMain: View {
  var body: some View {
    LinkNavigationView(
      linkNavigator: viewModel.linkNavigator,
      item: .init(path: Link.Authentication.Path.home.rawValue))
    .ignoresSafeArea()
  }
}
