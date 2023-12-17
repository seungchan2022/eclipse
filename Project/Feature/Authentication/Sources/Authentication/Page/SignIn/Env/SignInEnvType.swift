import Foundation
import Domain
import ComposableArchitecture

struct SignInEnvType {
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
