import Domain
import Architecture

public protocol AuthenticationEnvironmentUseable {
  var authUseCase: AuthUseCase { get }
  var toastViewModel: ToastViewModel { get }
}
