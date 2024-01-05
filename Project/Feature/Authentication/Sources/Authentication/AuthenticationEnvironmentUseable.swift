import Architecture
import Domain

public protocol AuthenticationEnvironmentUseable {
  var authUseCase: AuthUseCase { get }
  var toastViewModel: ToastViewModel { get }
}
