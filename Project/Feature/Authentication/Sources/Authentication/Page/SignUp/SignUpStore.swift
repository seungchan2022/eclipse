import Architecture
import ComposableArchitecture
import Domain
import Foundation

// MARK: - SignUpStore

struct SignUpStore {
  let env: SignUpEnvType
  let pageID = UUID().uuidString
}

// MARK: Reducer

extension SignUpStore: Reducer {
  var body: some ReducerOf<Self> {
    BindingReducer()
    Reduce { state, action in
      switch action {
      case .binding:
        return .none

      case .teardown:
        return .concatenate(
          CancelID.allCases.map { .cancel(pageID: pageID, id: $0) })

      case .onTapSignUp:
        return env.signUp(state)
          .cancellable(pageID: pageID, id: CancelID.requestSignUp, cancelInFlight: true)

      case .fetchSignUp(let result):
        switch result {
        case .success:
          env.routeToSignIn()
          return .none

        case .failure(let error):
          return .run { await $0(.throwError(error)) }
        }

      case .routeToSignIn:
        env.routeToSignIn()
        return .none

      case .throwError(let error):
        Logger.error(error)
        return .none
      }
    }
  }
}

// MARK: SignUpStore.State

extension SignUpStore {
  struct State: Equatable {
    init(injectionItem: Auth.Email.Request?) {
      _fetchSignUp = .init(.init(isLoading: false))

      email = injectionItem?.content ?? ""
      password = injectionItem?.password ?? ""
    }

    @Heap var fetchSignUp: FetchState.Empty
    @BindingState var email = ""
    @BindingState var password = ""
  }
}

// MARK: SignUpStore.Action

extension SignUpStore {
  enum Action: Equatable, BindableAction {
    case binding(BindingAction<State>)
    case teardown

    case onTapSignUp

    case fetchSignUp(Result<Bool, CompositeErrorRepository>)

    case routeToSignIn

    case throwError(CompositeErrorRepository)
  }
}

// MARK: SignUpStore.CancelID

extension SignUpStore {
  enum CancelID: Equatable, CaseIterable {
    case teardown
    case requestSignUp
  }
}
