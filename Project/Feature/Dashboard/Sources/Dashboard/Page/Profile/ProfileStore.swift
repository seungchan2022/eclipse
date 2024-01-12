import Architecture
import ComposableArchitecture
import Domain
import Foundation

struct ProfileStore {
  let env: ProfileEnvType
  let pageID = UUID().uuidString
}

extension ProfileStore: Reducer {
  var body: some ReducerOf<Self> {
    BindingReducer()
    Reduce { state, action in
      switch action {
      case .binding:
        return .none
        
      case .teardown:
        return .concatenate(
          CancelID.allCases.map { .cancel(pageID: pageID, id: $0) })
      }
    }
  }
}

extension ProfileStore {
  struct State: Equatable {
  }
}

extension ProfileStore { 
  enum Action: Equatable, BindableAction {
    case binding(BindingAction<State>)
    case teardown
  }
}

extension ProfileStore { 
  enum CancelID: Equatable, CaseIterable {
    case teardown
  }
}
