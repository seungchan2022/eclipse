import Architecture
import LinkNavigator

struct MeRouteBuilder<RootNavigator: RootNavigatorType> {
  static func generate() -> RouteBuilderOf<RootNavigator> {
    let matchPath = Link.Dashboard.Path.me.rawValue

    return .init(matchPath: matchPath) { navigator, _, diContainer -> RouteViewController? in
      guard let env: DashboardEnvironmentUseable = diContainer.resolve() else { return .none }

      return DebugWrappingController(matchPath: matchPath) {
        MePage(store: .init(
          initialState: MeStore.State(),
          reducer: {
            MeStore(env: .init(
              useCaseGroup: env,
              navigator: navigator))
          }))
      }
    }
  }
}
