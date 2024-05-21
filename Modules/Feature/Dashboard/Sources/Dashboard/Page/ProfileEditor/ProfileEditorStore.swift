import Architecture
import ComposableArchitecture
import Domain
import Foundation

// MARK: - ProfileStore

struct ProfileEditorStore {
  let env: ProfileEditorEnvType
  let pageID = UUID().uuidString
}

// MARK: Reducer

extension ProfileEditorStore: Reducer {
  var body: some ReducerOf<Self> {
    BindingReducer()
    Reduce { _, action in
      switch action {
      case .binding:
        return .none

      case .teardown:
        return .concatenate(
          CancelID.allCases.map { .cancel(pageID: pageID, id: $0) })
        
      case .routeToBack:
        env.routeToProfile()
        return .none
        
      }
    }
  }
}

// MARK: ProfileStore.State

extension ProfileEditorStore {
  struct State: Equatable { }
}

// MARK: ProfileStore.Action

extension ProfileEditorStore {
  enum Action: Equatable, BindableAction {
    case binding(BindingAction<State>)
    case teardown
    
    case routeToBack
  }
}

// MARK: ProfileStore.CancelID

extension ProfileEditorStore {
  enum CancelID: Equatable, CaseIterable {
    case teardown
  }
}

