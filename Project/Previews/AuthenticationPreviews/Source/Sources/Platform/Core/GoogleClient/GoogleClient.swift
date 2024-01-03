import Combine
import Domain
import FirebaseAuth
import Foundation
import GoogleSignIn
import GoogleSignInSwift
import UIKit

enum GoogleClient {

  static var rootViewController: UIViewController {
    guard let screen = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
      return .init()
    }

    guard let root = screen.windows.first?.rootViewController else {
      return .init()
    }

    return root
  }
}
