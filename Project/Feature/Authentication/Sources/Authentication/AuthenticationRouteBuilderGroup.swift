import Architecture
import LinkNavigator

public struct AuthenticationRouteBuilderGroup<RootNavigator: RootNavigatorType> {
  public init() { }
}

extension AuthenticationRouteBuilderGroup {
  public static var release: [RouteBuilderOf<RootNavigator>] {
    [
      SignInRouteBuilder.generate(),
      SignUpRouteBuilder.generate(),
      HomeRouteBuilder.generate(),
    ]
  }
}
