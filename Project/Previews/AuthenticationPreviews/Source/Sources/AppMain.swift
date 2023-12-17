import SwiftUI

@main
struct AppMain: App {
  
  @UIApplicationDelegateAdaptor var delegate: AppDelegate

  
  var body: some Scene {
    WindowGroup {
      Text("App Main")
    }
  }
}
