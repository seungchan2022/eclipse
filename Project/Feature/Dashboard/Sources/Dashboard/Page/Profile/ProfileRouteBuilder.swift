import Architecture
import LinkNavigator

struct ProfileRouteBuilder<RootNavigator: RootNavigatorType> {
  static func generate() -> RouteBuilderOf<RootNavigator> {
    let matchPath = Link.Dashboard.Path.profile.rawValue

    return .init(matchPath: matchPath) { navigator, _, diContainer -> RouteViewController? in
      guard let env: DashboardEnvironmentUseable = diContainer.resolve() else { return .none }

      return DebugWrappingController(matchPath: matchPath) {
        ProfilePage(store: .init(
          initialState: ProfileStore.State(),
          reducer: {
            ProfileStore(env: .init(
              useCaseGroup: env,
              navigator: navigator))
          }))
      }
    }
  }
}
