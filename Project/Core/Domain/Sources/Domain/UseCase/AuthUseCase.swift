import Combine
import Foundation

public protocol AuthUseCase {
  var signUpEmail: (Auth.Email.Request) -> AnyPublisher<Void, CompositeErrorRepository> { get }
  var signInEmail: (Auth.Email.Request) -> AnyPublisher<Void, CompositeErrorRepository> { get }

  var signOut: () -> AnyPublisher<Void, CompositeErrorRepository> { get }
  var me: () -> AnyPublisher<Auth.Me.Response?, CompositeErrorRepository> { get }

  var signInGoogle: () -> AnyPublisher<Void, CompositeErrorRepository> { get }
  var signInApple: () -> AnyPublisher<Void, CompositeErrorRepository> { get }
}
