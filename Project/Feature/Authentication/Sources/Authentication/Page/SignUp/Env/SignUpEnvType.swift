import Foundation
import Domain
import ComposableArchitecture
import CombineExt

struct SignUpEnvType {
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

extension SignUpEnvType {
  
}
