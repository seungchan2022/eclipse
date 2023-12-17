import Domain

public protocol AuthenticationEnvironmentUseable {
  var authUseCase: AuthUseCase { get }
}
