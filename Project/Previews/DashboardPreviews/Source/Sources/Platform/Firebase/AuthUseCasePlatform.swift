import Combine
import Domain
import Firebase
import FirebaseAuth
import Foundation
import GoogleSignIn
import GoogleSignInSwift
import SwiftUI

// MARK: - AuthUseCasePlatform

public struct AuthUseCasePlatform { }

// MARK: AuthUseCase

extension AuthUseCasePlatform: AuthUseCase {

  public var signUpEmail: (Domain.Auth.Email.Request) -> AnyPublisher<Void, CompositeErrorRepository> {
    { req in
      Future<Void, CompositeErrorRepository> { promise in
        FirebaseAuth.Auth.auth().createUser(withEmail: req.content, password: req.password) { _, error in
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
        FirebaseAuth.Auth.auth().signIn(withEmail: req.content, password: req.password) { _, error in
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

  public var me: () -> AnyPublisher<Domain.Auth.Me.Response?, CompositeErrorRepository> {
    {
      Future<Domain.Auth.Me.Response?, CompositeErrorRepository> { promise in
        guard let me = FirebaseAuth.Auth.auth().currentUser else {
          /// 만약 사용자가 현재 로그인을 하지 않았으면 없는 상태이기 때문에 에러가 아니고 .none인 상태
          return promise(.success(.none))
        }
        return promise(.success(me.serialized()))
      }
      .eraseToAnyPublisher()
    }
  }

  public var signInGoogle: () -> AnyPublisher<Void, CompositeErrorRepository> {
    {
      Future<Void, CompositeErrorRepository> { promise in
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }

        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config

        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(withPresenting: GoogleClient.rootViewController) { result, error in
          if let error { promise(.failure(.other(error))) }

          guard 
            let user = result?.user,
            let idToken = user.idToken?.tokenString
          else { return }

          let credential = GoogleAuthProvider.credential(
            withIDToken: idToken,
            accessToken: user.accessToken.tokenString)

          Auth.auth().signIn(with: credential) { _, error in
            if let error { promise(.failure(.other(error))) }

            return promise(.success(Void()))
          }
        }
      }
      .eraseToAnyPublisher()
    }
  }

  public var signInApple: () -> AnyPublisher<Void, CompositeErrorRepository> {
    {
      Future<Void, CompositeErrorRepository> { _ in
      }
      .eraseToAnyPublisher()
    }
  }
}

extension User {
  fileprivate func serialized() -> Domain.Auth.Me.Response {
    .init(
      uid: uid,
      email: email,
      photoURL: photoURL?.absoluteString)
  }
}
