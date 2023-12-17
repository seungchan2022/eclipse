import Foundation
import Combine

public protocol AuthUseCase {
  var signUpEmail: (Auth.Email.Request) -> AnyPublisher<Void, CompositeErrorRepository> { get }
  var signInEmail: (Auth.Email.Request) -> AnyPublisher<Void, CompositeErrorRepository> { get }
  var signOut: () -> AnyPublisher<Void, CompositeErrorRepository> { get }
}
