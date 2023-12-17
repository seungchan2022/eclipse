import Domain
import Foundation
import LinkNavigator
import Platform
import Authentication

struct AppSideEffect: DependencyType, AuthenticationEnvironmentUseable {
  let authUseCase: AuthUseCase
}

extension AppSideEffect {
  static func build() -> Self {
    .init(authUseCase: AuthUseCasePlatform())
  }
}
