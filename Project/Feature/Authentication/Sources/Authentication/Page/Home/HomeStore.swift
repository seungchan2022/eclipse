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
    Reduce { _, action in
      switch action {
      case .binding:
        return .none

      case .teardown:
        return .concatenate(
          CancelID.allCases.map { .cancel(pageID: pageID, id: $0) })

      case .getUser:
        return env.user()
          .cancellable(pageID: pageID, id: CancelID.requestGetUser, cancelInFlight: true)

      case .fetchUser(let result):
        switch result {
        case .success(let isLoggedIn):
          switch isLoggedIn {
          case true: env.routeToMe()
          case false: env.routeToSignIn()
          }

          return .none

        case .failure(let error):
          return .run { await $0(.throwError(error)) }
        }

      case .throwError(let error):
        Logger.error(error)
        return .none
      }
    }
  }
}

// MARK: HomeStore.State

extension HomeStore {
  struct State: Equatable {
    init() {
      _fetchUser = .init(.init(isLoading: false))
    }

    @Heap var fetchUser: FetchState.Empty
  }
}

// MARK: HomeStore.Action

extension HomeStore {
  enum Action: Equatable, BindableAction {
    case binding(BindingAction<State>)
    case teardown

    case getUser

    case fetchUser(Result<Bool, CompositeErrorRepository>)

    case throwError(CompositeErrorRepository)
  }
}

// MARK: HomeStore.CancelID

extension HomeStore {
  enum CancelID: Equatable, CaseIterable {
    case teardown
    case requestGetUser
  }
}
