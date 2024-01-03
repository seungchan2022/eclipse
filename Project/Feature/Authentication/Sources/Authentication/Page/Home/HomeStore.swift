import Architecture
import ComposableArchitecture
import Domain
import Foundation

// MARK: - HomeStore

struct HomeStore {
  let env: HomeEnvType
  let pageID = UUID().uuidString
}

// MARK: Reducer

extension HomeStore: Reducer {
  var body: some ReducerOf<Self> {
    BindingReducer()
    Reduce { state, action in
      switch action {
      case .binding:
        return .none

      case .teardown:
        return .concatenate(
          CancelID.allCases.map { .cancel(pageID: pageID, id: $0) })

      case .onTapSignOut:
        return env.signOut()
          .cancellable(pageID: pageID, id: CancelID.requestSignOut, cancelInFlight: true)

      case .getUser:
        return env.user()
          .cancellable(pageID: pageID, id: CancelID.requestGetUser, cancelInFlight: true)

      case .getUserInfo:
        return env.userInfo()
          .cancellable(pageID: pageID, id: CancelID.requestGetUserInfo, cancelInFlight: true)

      case .fetchSignOut(let result):
        switch result {
        case .success:
          env.routeToSignIn()
          return .none

        case .failure(let error):
          return .run { await $0(.throwError(error)) }
        }

      case .fetchUser(let result):
        switch result {
        case .success:
          return .none

        case .failure(let error):
          return .run { await $0(.throwError(error)) }
        }

      case .fetchUserInfo(let result):
        switch result {
        case .success(let item):
          state.item = item ?? .init(uid: "", email: "", photoURL: "")
          return .none

        case .failure(let error):
          return .run { await $0(.throwError(error)) }
        }

      case .throwError(let error):
//        print(error)
        return .none
      }
    }
  }
}

// MARK: HomeStore.State

extension HomeStore {
  struct State: Equatable {
    init() {
      _fetchSignOut = .init(.init(isLoading: false))
      _fetchUser = .init(.init(isLoading: false))
      _fetchUserInfo = .init(.init(isLoading: false))

      item = .init(uid: "", email: "", photoURL: "")
    }

    @Heap var fetchSignOut: FetchState.Empty
    @Heap var fetchUser: FetchState.Empty
    @Heap var fetchUserInfo: FetchState.Empty

    var item: Auth.Me.Response

  }
}

// MARK: HomeStore.Action

extension HomeStore {
  enum Action: Equatable, BindableAction {
    case binding(BindingAction<State>)
    case teardown

    case onTapSignOut

    case getUser
    case getUserInfo

    case fetchSignOut(Result<Bool, CompositeErrorRepository>)
    case fetchUser(Result<Bool, CompositeErrorRepository>)
    case fetchUserInfo(Result<Auth.Me.Response?, CompositeErrorRepository>)

    case throwError(CompositeErrorRepository)
  }
}

// MARK: HomeStore.CancelID

extension HomeStore {
  enum CancelID: Equatable, CaseIterable {
    case teardown
    case requestSignOut
    case requestGetUser
    case requestGetUserInfo
  }
}
