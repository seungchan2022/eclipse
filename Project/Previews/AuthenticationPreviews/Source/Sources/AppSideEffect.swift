import Authentication
import Domain
import Foundation
import LinkNavigator
import Platform

// MARK: - AppSideEffect

struct AppSideEffect: DependencyType, AuthenticationEnvironmentUseable {
  let authUseCase: AuthUseCase
}

extension AppSideEffect {
  static func build() -> Self {
    .init(authUseCase: AuthUseCasePlatform())
  }
}
