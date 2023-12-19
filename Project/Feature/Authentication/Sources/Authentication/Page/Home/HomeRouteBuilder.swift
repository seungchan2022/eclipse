import Architecture
import LinkNavigator

struct HomeRouteBuilder<RootNavigator: RootNavigatorType> {
  static func generate() -> RouteBuilderOf<RootNavigator> {
    let matchPath = Link.Authentication.Path.home.rawValue
    
    return .init(matchPath: matchPath) { navigator, _, diContainer -> RouteViewController? in
      guard let env: AuthenticationEnvironmentUseable = diContainer.resolve() else { return .none }
      
      return DebugWrappingController(matchPath: matchPath) {
        HomePage(store: .init(
          initialState: HomeStore.State(),
          reducer: {
            HomeStore(env: .init(
              useCaseGroup: env,
              navigator: navigator))
          }))
      }
    }
  }
}
