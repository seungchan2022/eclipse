import Architecture
import CombineExt
import ComposableArchitecture
import Domain
import Foundation
import LinkNavigator

// MARK: - MeEnvType

struct MeEnvType {
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

extension MeEnvType {
  var signOut: () -> Effect<MeStore.Action> {
    {
      .publisher {
        useCaseGroup.authUseCase
          .signOut()
          .map { _ in true }
          .mapToResult()
          .receive(on: mainQueue)
          .map(MeStore.Action.fetchSignOut)
      }
    }
  }

  var routeToSignIn: () -> Void {
    {
      navigator.replace(
        linkItem: .init(path: Link.Authentication.Path.signIn.rawValue),
        isAnimated: false)
    }
  }

  var user: () -> Effect<MeStore.Action> {
    {
      .publisher {
        useCaseGroup.authUseCase
          .me()
          .map { _ in true }
          .mapToResult()
          .receive(on: mainQueue)
          .map(MeStore.Action.fetchUser)
      }
    }
  }

  var userInfo: () -> Effect<MeStore.Action> {
    {
      .publisher {
        useCaseGroup.authUseCase
          .me()
          .mapToResult()
          .receive(on: mainQueue)
          .map(MeStore.Action.fetchUserInfo)
      }
    }
  }
}
