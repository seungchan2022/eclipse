import Foundation
import Domain
import ComposableArchitecture
import CombineExt

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

extension SignInEnvType {
  var signInTest: () -> Effect<SignInStore.Action> {
    {
      .publisher {
        useCaseGroup.authUseCase
          .me()
//          .signOut()
//          .signInEmail(.init(content: "test@test.com", password: "123456"))
//          .signUpEmail(.init(content: "test@test.com", password: "123456"))
          .map { _ in true }
          .mapToResult()
          .receive(on: mainQueue)
          .map(SignInStore.Action.fetchTest)
      }
    }
  }
}
