import Architecture
import Combine
import CombineExt
import ComposableArchitecture
import Domain
import Foundation
import LinkNavigator

// MARK: - SignInEnvType

struct SignInEnvType {
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

extension SignInEnvType {
  var signEmail: (SignInStore.State) -> Effect<SignInStore.Action> {
    { state in
      .publisher {
        useCaseGroup.authUseCase
          .signInEmail(.init(content: state.email, password: state.password))
          .map { _ in true }
          .mapToResult()
          .receive(on: mainQueue)
          .map(SignInStore.Action.fetchSignInEmail)
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
          path: Link.Authentication.Path.home.rawValue),
        isAnimated: true)
    }
  }

  var signInGoogle: () -> Effect<SignInStore.Action> {
    {
      .publisher {
        useCaseGroup.authUseCase
          .signInGoogle()
          .map { _ in true }
          .mapToResult()
          .receive(on: mainQueue)
          .map(SignInStore.Action.fetchSignInGoogle)
      }
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
