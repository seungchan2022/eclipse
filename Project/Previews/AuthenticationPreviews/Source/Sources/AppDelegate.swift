import Firebase
import GoogleSignIn
import UIKit

final class AppDelegate: UIResponder, UIApplicationDelegate {
  func application(_: UIApplication, didFinishLaunchingWithOptions _: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }

  func application(_: UIApplication, open url: URL, options _: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool {
    GIDSignIn.sharedInstance.handle(url)
  }
}
