import Architecture
import FirebaseAuth
import LinkNavigator
import SwiftUI

// MARK: - AppMain

struct AppMain {
  let viewModel: AppViewModel
  @State private var isLoggendIn = false
}

// MARK: View

extension AppMain: View {
  var body: some View {
    LinkNavigationView(
      linkNavigator: viewModel.linkNavigator,
      item: .init(path: Link.Authentication.Path.home.rawValue))
//    LinkNavigationView(
//      linkNavigator: viewModel.linkNavigator,
//      item: .init(path: Link.Dashboard.Path.profile.rawValue))
      .ignoresSafeArea()
  }
}
