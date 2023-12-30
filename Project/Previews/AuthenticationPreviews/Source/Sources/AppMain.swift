import SwiftUI
import LinkNavigator
import Architecture

@main
struct AppMain: App {
  
  @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

  @State private var viewModel = AppViewModel()
  
  var body: some Scene {
    WindowGroup {
      LinkNavigationView(
        linkNavigator: viewModel.linkNavigator,
        item: .init(path: Link.Authentication.Path.signIn.rawValue))
      
      .ignoresSafeArea()
    }
  }
}
