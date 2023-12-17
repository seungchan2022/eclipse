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
  
  public var me: () -> AnyPublisher<Domain.Auth.Me.Response?, CompositeErrorRepository> {
    {
      Future<Domain.Auth.Me.Response?, CompositeErrorRepository> { promise in
        guard let me = FirebaseAuth.Auth.auth().currentUser else {
          print("AAA: 로그인 안한 상태")
          /// 만약 사용자가 현재 로그인을 하지 않았으면 없는 상태이기 때문에 에러가 아니고 .none인 상태
          return promise(.success(.none))
        }
        print("BBB: 현재 로그인한 사용자 정보", me.serialized())
        return promise(.success(me.serialized()))
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
