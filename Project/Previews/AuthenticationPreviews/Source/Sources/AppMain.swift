import SwiftUI
import LinkNavigator
import Architecture
import FirebaseAuth

@main
struct AppMain: App {
  
  @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate

  @State private var viewModel = AppViewModel()
  @State private var isLoggendIn = false
  
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
        if let _ = Auth.auth().currentUser {
          self.isLoggendIn = true
        }
      }
      .ignoresSafeArea()
    }
  }
}
