import Architecture
import Foundation
import LinkNavigator
import Authentication

struct AppRouteBuilderGroup<RootNavigator: RootNavigatorType> {
  
  var release: [RouteBuilderOf<RootNavigator>] {
    AuthenticationRouteBuilderGroup.release
  }
}
