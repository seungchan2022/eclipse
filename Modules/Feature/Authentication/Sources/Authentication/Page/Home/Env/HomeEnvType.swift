import Architecture
import CombineExt
import ComposableArchitecture
import Domain
import Foundation
import LinkNavigator

// MARK: - HomeEnvType

struct HomeEnvType {
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

extension HomeEnvType {

  var routeToSignIn: () -> Void {
    {
      navigator.replace(
        linkItem: .init(path: Link.Authentication.Path.signIn.rawValue),
        isAnimated: false)
    }
  }

  var routeToMe: () -> Void {
    {
      navigator.replace(
        linkItem: .init(path: Link.Dashboard.Path.me.rawValue),
        isAnimated: false)
    }
  }

  var user: () -> Effect<HomeStore.Action> {
    {
      .publisher {
        useCaseGroup.authUseCase
          .me()
          .map { $0 != .none }
          .mapToResult()
          .receive(on: mainQueue)
          .map(HomeStore.Action.fetchUser)
      }
    }
  }
}
