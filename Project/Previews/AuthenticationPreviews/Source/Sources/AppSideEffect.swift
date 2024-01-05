import Architecture
import Authentication
import Domain
import Foundation
import LinkNavigator
import Platform

// MARK: - AppSideEffect

struct AppSideEffect: DependencyType, AuthenticationEnvironmentUseable {
  let authUseCase: AuthUseCase
  let toastViewModel: ToastViewModel
}
