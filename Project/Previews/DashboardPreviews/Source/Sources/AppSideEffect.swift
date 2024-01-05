import Architecture
import Dashboard
import Domain
import Foundation
import LinkNavigator
import Platform

// MARK: - AppSideEffect

struct AppSideEffect: DependencyType, DashboardEnvironmentUseable {
  let authUseCase: AuthUseCase
  let toastViewModel: ToastViewModel
}
