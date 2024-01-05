import Architecture
import LinkNavigator

// MARK: - AuthenticationRouteBuilderGroup

public struct DashboardRouteBuilderGroup<RootNavigator: RootNavigatorType> {
  public init() { }
}

extension DashboardRouteBuilderGroup {
  public static var release: [RouteBuilderOf<RootNavigator>] {
    [
      MeRouteBuilder.generate(),
    ]
  }
}
