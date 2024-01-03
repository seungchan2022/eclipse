import Architecture
import FirebaseAuth
import LinkNavigator
import SwiftUI

@main
struct AppMain: App {

  // MARK: Internal

  @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

  var body: some Scene {
    WindowGroup {
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

  // MARK: Private

  @State private var viewModel = AppViewModel()
  @State private var isLoggendIn = false
}
