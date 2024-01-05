import Authentication
import Domain
import Foundation
import LinkNavigator
import Platform
import Architecture

// MARK: - AppSideEffect

struct AppSideEffect: DependencyType, AuthenticationEnvironmentUseable {
  let authUseCase: AuthUseCase
  let toastViewModel: ToastViewModel
}
