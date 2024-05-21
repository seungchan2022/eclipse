import Architecture
import Domain
import ComposableArchitecture
import Foundation

struct PlusStore {
  let env: PlusEnvType
  let pageID = UUID().uuidString
}


extension PlusStore: Reducer {
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

extension PlusStore {
  struct State: Equatable {
    
  }
}


extension PlusStore {
  enum Action: Equatable, BindableAction {
    case binding(BindingAction<State>)
    case teardown
  }
}

extension PlusStore {
  enum CancelID: Equatable, CaseIterable {
    case teardown
  }
}
