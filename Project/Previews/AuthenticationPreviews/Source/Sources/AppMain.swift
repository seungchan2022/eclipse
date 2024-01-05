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
    Group {
      if isLoggendIn {
        LinkNavigationView(
          linkNavigator: viewModel.linkNavigator,
          item: .init(path: Link.Authentication.Path.home.rawValue))
      } else {
        LinkNavigationView(
          linkNavigator: viewModel.linkNavigator,
          item: .init(path: Link.Authentication.Path.signIn.rawValue))
      }
    }
    .onAppear {
      if Auth.auth().currentUser != .none {
        isLoggendIn = true
      }
    }
    .ignoresSafeArea()
  }
}
