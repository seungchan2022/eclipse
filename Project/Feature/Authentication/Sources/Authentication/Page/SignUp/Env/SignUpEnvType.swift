import Foundation
import Architecture
import Domain
import ComposableArchitecture
import CombineExt
import LinkNavigator
import Combine

struct SignUpEnvType {
  let useCaseGroup: AuthenticationEnvironmentUseable
  let mainQueue: AnySchedulerOf<DispatchQueue>
  let navigator: RootNavigatorType
  
  init(
    useCaseGroup: AuthenticationEnvironmentUseable,
    mainQueue: AnySchedulerOf<DispatchQueue> = .main,
    navigator: RootNavigatorType
  )
  {
    self.useCaseGroup = useCaseGroup
    self.mainQueue = mainQueue
    self.navigator = navigator
  }
}

extension SignUpEnvType {
  var signUp: (SignUpStore.State) -> Effect<SignUpStore.Action> {
    { state in
        .publisher {
          Just(state.serialized())
            .flatMap(useCaseGroup.authUseCase.signUpEmail)
            .mapToResult()
            .receive(on: mainQueue)
            .map(SignUpStore.Action.fetchSignUp)
        }
    }
  }
  
  var routeToSignIn: () -> Void {
    {
      navigator.back(isAnimated: true)
    }
  }
}

extension SignUpStore.State {
  fileprivate func serialized() -> Auth.Email.Request {
    .init(
      content: email,
      password: password)
  }
}
