import Foundation
import Combine

public protocol AuthUseCase {
  var signUpEmail: (Auth.Email.Request) -> AnyPublisher<Auth.Email.Request, CompositeErrorRepository> { get }
  var signInEmail: (Auth.Email.Request) -> AnyPublisher<Auth.Email.Request, CompositeErrorRepository> { get }
  var signOut: () -> AnyPublisher<Void, CompositeErrorRepository> { get }
  var me: () -> AnyPublisher<Auth.Me.Response?, CompositeErrorRepository> { get }
}
