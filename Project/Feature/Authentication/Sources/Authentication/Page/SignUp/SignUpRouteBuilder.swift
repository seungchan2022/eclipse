import Architecture
import LinkNavigator

struct SignUpRouteBuilder<RootNavigator: RootNavigatorType> {
  static func generate() -> RouteBuilderOf<RootNavigator> {
    let matchPath = Link.Authentication.Path.signUp.rawValue
    
    return .init(matchPath: matchPath) { navigator, _, diContainer -> RouteViewController? in
      guard let env: AuthenticationEnvironmentUseable = diContainer.resolve() else { return .none }
      
      return DebugWrappingController(matchPath: matchPath) {
        SignUpPage(store: .init(
          initialState: SignUpStore.State(),
          reducer: {
            SignUpStore(env: .init(useCaseGroup: env))
          }))
      }
    }
  }
}
