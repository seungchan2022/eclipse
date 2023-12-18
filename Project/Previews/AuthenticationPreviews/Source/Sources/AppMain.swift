import SwiftUI
import LinkNavigator
import Architecture

@main
struct AppMain: App {
  
  @UIApplicationDelegateAdaptor var delegate: AppDelegate

  @State private var viewModel = AppViewModel()
  
  var body: some Scene {
    WindowGroup {
      LinkNavigationView(
        linkNavigator: viewModel.linkNavigator,
        item: .init(path: Link.Authentication.Path.signUp.rawValue))
      .ignoresSafeArea()
    }
  }
}
