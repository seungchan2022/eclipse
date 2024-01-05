import Architecture
import LinkNavigator

// MARK: - DashboardRouteBuilderGroup

public struct DashboardRouteBuilderGroup<RootNavigator: RootNavigatorType> {
  public init() { }
}

extension DashboardRouteBuilderGroup {
  public static var release: [RouteBuilderOf<RootNavigator>] {
    [
      MeRouteBuilder.generate(),
    ]
  }
  
  public static var template: [RouteBuilderOf<RootNavigator>] {
    [
      HomeRouteBuilder.generate(),
      SignInRouteBuilder.generate(),
    ]
  }
}
