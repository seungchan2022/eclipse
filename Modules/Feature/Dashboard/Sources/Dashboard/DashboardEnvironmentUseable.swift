import Architecture
import Domain

public protocol DashboardEnvironmentUseable {
  var authUseCase: AuthUseCase { get }
  var toastViewModel: ToastViewModel { get }
}
