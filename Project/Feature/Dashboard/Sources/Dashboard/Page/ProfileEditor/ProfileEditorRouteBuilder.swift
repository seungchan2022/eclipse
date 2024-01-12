import Architecture
import LinkNavigator

struct ProfileEditorRouteBuilder<RootNavigator: RootNavigatorType> { 
  static func generate() -> RouteBuilderOf<RootNavigator> {
    let matchPath = Link.Dashboard.Path.profileEditor.rawValue
    
    return .init(matchPath: matchPath) { navigator, item, diContainer -> RouteViewController? in
      guard let env: DashboardEnvironmentUseable = diContainer.resolve() else { return .none }
      
      return DebugWrappingController(matchPath: matchPath) {
        ProfileEditorPage(store: .init(
          initialState: ProfileEditorStore.State(),
          reducer: {
            ProfileEditorStore(env: .init(
              useCaseGroup: env,
              navigator: navigator))
          }))
      }
    }
  }
}
