import Foundation
import UIKit
import Combine
import Domain
import GoogleSignIn
import GoogleSignInSwift
import FirebaseAuth

final class GoogleClient {
  
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

