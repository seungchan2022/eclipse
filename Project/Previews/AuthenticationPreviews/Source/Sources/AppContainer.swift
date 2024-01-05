import Foundation
import Architecture
import LinkNavigator

final class AppContainer {
  
  let dependency: AppSideEffect
  let navigator: SingleLinkNavigator
  
  init(dependency: AppSideEffect, navigator: SingleLinkNavigator) {
    self.dependency = dependency
    self.navigator = navigator
  }
}

extension AppContainer {
  class func build() -> AppContainer {
    let sideEffect = AppSideEffect(
      authUseCase: AuthUseCasePlatform(),
      toastViewModel: .init())
    
    return .init(
      dependency: sideEffect,
      navigator: .init(
        routeBuilderItemList: AppRouteBuilderGroup().release,
        dependency: sideEffect))
  }
}
