import Domain
import Foundation
import Firebase
import FirebaseAuth
import Combine

public struct AuthUseCasePlatform {
  
}

extension AuthUseCasePlatform: AuthUseCase {
  public var signUpEmail: (Domain.Auth.Email.Request) -> AnyPublisher<Void, CompositeErrorRepository> {
    { req in
      Future<Void, CompositeErrorRepository> { promise in
        FirebaseAuth.Auth.auth().createUser(withEmail: req.content, password: req.password) { result, error in
          if let error { promise(.failure(.other(error))) }
          return promise(.success(Void()))
        }
      }
      .eraseToAnyPublisher()
    }
  }
//  Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
//    guard let strongSelf = self else { return }
//    // ...
//  }
  public var signInEmail: (Domain.Auth.Email.Request) -> AnyPublisher<Void, CompositeErrorRepository> {
    { req in
      Future<Void, CompositeErrorRepository> { promise in
        FirebaseAuth.Auth.auth().signIn(withEmail: req.content, password: req.password) { result, error in
          if let error { promise(.failure(.other(error))) }
          return promise(.success(Void()))
        }
      }
      .eraseToAnyPublisher()
    }
  }
}
