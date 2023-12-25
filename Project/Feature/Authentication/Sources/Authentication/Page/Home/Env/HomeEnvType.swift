import Foundation
import Domain
import Architecture
import ComposableArchitecture
import CombineExt
import LinkNavigator

struct HomeEnvType {
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

extension HomeEnvType {
  var signOut: () -> Effect<HomeStore.Action> {
    {
      .publisher {
        useCaseGroup.authUseCase
          .signOut()
          .map { _ in true }
          .mapToResult()
          .receive(on: mainQueue)
          .map(HomeStore.Action.fetchSignOut)
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
    
  var user: () -> Effect<HomeStore.Action> {
    {
      .publisher {
        useCaseGroup.authUseCase
          .me()
          .map { _ in true }
          .mapToResult()
          .receive(on: mainQueue)
          .map(HomeStore.Action.fetchUser)
      }
    }
  }
  
  var userInfo: () -> Effect<HomeStore.Action> {
    {
      .publisher {
        useCaseGroup.authUseCase
          .me()
          .mapToResult()
          .receive(on: mainQueue)
          .map(HomeStore.Action.fetchUserInfo)
      }
    }
  }
}
