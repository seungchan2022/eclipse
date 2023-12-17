import Domain
import Foundation
import LinkNavigator

@Observable
final class AppViewModel {
  
  init() {
    linkNavigator = SingleLinkNavigator(
      routeBuilderItemList: AppRouteBuilderGroup().release,
      dependency: AppSideEffect.build())
  }
  
  let linkNavigator: SingleLinkNavigator
}
