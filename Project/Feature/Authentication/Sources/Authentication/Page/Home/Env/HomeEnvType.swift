import Foundation
import Domain
import Architecture
import ComposableArchitecture
import CombineExt

struct HomeEnvType {
  let useCaseGroup: AuthenticationEnvironmentUseable
  let mainQueue: AnySchedulerOf<DispatchQueue>
  
  init(
    useCaseGroup: AuthenticationEnvironmentUseable,
    mainQueue: AnySchedulerOf<DispatchQueue> = .main)
  {
    self.useCaseGroup = useCaseGroup
    self.mainQueue = mainQueue
  }
}

extension HomeEnvType {
  
}
