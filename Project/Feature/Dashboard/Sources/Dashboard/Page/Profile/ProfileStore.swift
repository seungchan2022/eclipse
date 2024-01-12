import Architecture
import ComposableArchitecture
import Domain
import Foundation

// MARK: - ProfileStore

struct ProfileStore {
  let env: ProfileEnvType
  let pageID = UUID().uuidString
}

// MARK: Reducer

extension ProfileStore: Reducer {
  var body: some ReducerOf<Self> {
    BindingReducer()
    Reduce { _, action in
      switch action {
      case .binding:
        .none

      case .teardown:
        .concatenate(
          CancelID.allCases.map { .cancel(pageID: pageID, id: $0) })
      }
    }
  }
}

// MARK: ProfileStore.State

extension ProfileStore {
  struct State: Equatable { }
}

// MARK: ProfileStore.Action

extension ProfileStore {
  enum Action: Equatable, BindableAction {
    case binding(BindingAction<State>)
    case teardown
  }
}

// MARK: ProfileStore.CancelID

extension ProfileStore {
  enum CancelID: Equatable, CaseIterable {
    case teardown
  }
}
