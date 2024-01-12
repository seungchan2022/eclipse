import Architecture
import CombineExt
import ComposableArchitecture
import Domain
import Foundation
import LinkNavigator

struct ProfileEnvType {
  let useCaseGroup: DashboardEnvironmentUseable
  let mainQueue: AnySchedulerOf<DispatchQueue>
  let navigator: RootNavigatorType
  
  init(
    useCaseGroup: DashboardEnvironmentUseable,
    mainQueue: AnySchedulerOf<DispatchQueue> = .main,
    navigator: RootNavigatorType)
  {
    self.useCaseGroup = useCaseGroup
    self.mainQueue = mainQueue
    self.navigator = navigator
  }
}

extension ProfileEnvType { }
