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
  
  public var signOut: () -> AnyPublisher<Void, CompositeErrorRepository> {
    {
      Future<Void, CompositeErrorRepository> { promise in
        do {
          try FirebaseAuth.Auth.auth().signOut()
          return promise(.success(Void()))
        } catch {
          return promise(.failure(.other(error)))
        }
      }
      .eraseToAnyPublisher()
    }
  }
}
