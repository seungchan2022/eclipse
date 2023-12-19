import Architecture
import LinkNavigator

struct SignUpRouteBuilder<RootNavigator: RootNavigatorType> {
  static func generate() -> RouteBuilderOf<RootNavigator> {
    let matchPath = Link.Authentication.Path.signUp.rawValue
    
    return .init(matchPath: matchPath) { navigator, item, diContainer -> RouteViewController? in
      guard let env: AuthenticationEnvironmentUseable = diContainer.resolve() else { return .none }
      
      return DebugWrappingController(matchPath: matchPath) {
        SignUpPage(store: .init(
          initialState: SignUpStore.State(injectionItem: item.decoded()),
          reducer: {
            SignUpStore(env: .init(
              useCaseGroup: env,
              navigator: navigator))
          }))
      }
    }
  }
}
