import Foundation
import Architecture
import Domain
import ComposableArchitecture
import CombineExt
import LinkNavigator
import Combine

struct SignInEnvType {
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

extension SignInEnvType {
  var signIn: (SignInStore.State) -> Effect<SignInStore.Action> {
    { state in
        .publisher {
          Just(state.serialized())
            .flatMap(useCaseGroup.authUseCase.signInEmail)
            .mapToResult()
            .receive(on: mainQueue)
            .map(SignInStore.Action.fetchSignIn)
        }
    }
  }
  
  var routeToSignUp: () -> Void {
    {
      navigator.backOrNext(
        linkItem: .init(
          path: Link.Authentication.Path.signUp.rawValue),
        isAnimated: true)
    }
  }
  
  var routeToHome: () -> Void {
    {
      navigator.backOrNext(
        linkItem: .init(
          path: Link.Authentication.Path.home.rawValue,
          items: ""),
        isAnimated: true)
    }
  }
}

extension SignInStore.State {
  fileprivate func serialized() -> Auth.Email.Request {
    .init(
      content: email,
      password: password)
  }
}
