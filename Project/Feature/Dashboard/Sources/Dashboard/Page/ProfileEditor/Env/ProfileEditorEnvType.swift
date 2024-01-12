import Architecture
import Domain
import CombineExt
import ComposableArchitecture
import Foundation
import LinkNavigator

struct ProfileEditorEnvType {
  let useCaseGroup: DashboardEnvironmentUseable
  let mainQueue: AnySchedulerOf<DispatchQueue>
  let navigator: RootNavigatorType
  
  init(
    useCaseGroup: DashboardEnvironmentUseable,
    mainQueue: AnySchedulerOf<DispatchQueue> = .main,
    navigator: RootNavigatorType) {
    self.useCaseGroup = useCaseGroup
    self.mainQueue = mainQueue
    self.navigator = navigator
  }
}

extension ProfileEditorEnvType { 
  var routeToProfile: () -> Void {
    {
      navigator.back(isAnimated: true)
    }
  }
}
