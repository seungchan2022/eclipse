import Architecture
import Combine
import CombineExt
import ComposableArchitecture
import Domain
import Foundation
import LinkNavigator

// MARK: - SignUpEnvType

struct SignUpEnvType {
  let useCaseGroup: AuthenticationEnvironmentUseable
  let mainQueue: AnySchedulerOf<DispatchQueue>
  let navigator: RootNavigatorType

  init(
    useCaseGroup: AuthenticationEnvironmentUseable,
    mainQueue: AnySchedulerOf<DispatchQueue> = .main,
    navigator: RootNavigatorType)
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
        useCaseGroup.authUseCase
          .signUpEmail(.init(content: state.email, password: state.password))
          .map { _ in true }
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
