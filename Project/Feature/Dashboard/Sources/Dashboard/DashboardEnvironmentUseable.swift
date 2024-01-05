import Domain
import Architecture

public protocol DashboardEnvironmentUseable {
  var authUseCase: AuthUseCase { get }
  var toastViewModel: ToastViewModel { get }
}

