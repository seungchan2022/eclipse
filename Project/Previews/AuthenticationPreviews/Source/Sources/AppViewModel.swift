import Domain
import Foundation
import LinkNavigator

@Observable
final class AppViewModel {

  // MARK: Lifecycle

  init() {
    linkNavigator = SingleLinkNavigator(
      routeBuilderItemList: AppRouteBuilderGroup().release,
      dependency: AppSideEffect.build())
  }

  // MARK: Internal

  let linkNavigator: SingleLinkNavigator
}
