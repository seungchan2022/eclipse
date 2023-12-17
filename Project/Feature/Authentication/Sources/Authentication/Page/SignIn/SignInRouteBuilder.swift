import Architecture
import LinkNavigator

struct SignInRouteBuilder<RootNavigator: RootNavigatorType> {
  static func generate() -> RouteBuilderOf<RootNavigator> {
    let matchPath = Link.Authentication.Path.signIn.rawValue
    
    return .init(matchPath: matchPath) { navigator, _, diContainer -> RouteViewController? in
      guard let env: AuthenticationEnvironmentUseable = diContainer.resolve() else { return .none }
      
      return DebugWrappingController(matchPath: matchPath) {
        SignInPage(store: .init(
          initialState: SignInStore.State(),
          reducer: {
            SignInStore(env: .init(useCaseGroup: env))
        }))
      }
    }
  }
}
