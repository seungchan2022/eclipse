import Foundation
import Architecture
import Domain
import ComposableArchitecture

struct HomeStore {
  let env: HomeEnvType
  let pageID = UUID().uuidString
}

extension HomeStore: Reducer {
  var body: some ReducerOf<Self> {
    BindingReducer()
    Reduce { state, action in
      switch action {
      case .binding:
        return .none
        
      case .teardown:
        return .none
      }
    }
  }
}

extension HomeStore {
  struct State: Equatable {
    
  }
}

extension HomeStore {
  enum Action: Equatable, BindableAction {
    case binding(BindingAction<State>)
    case teardown
  }
}

extension HomeStore { 
  enum CancelID: Equatable, CaseIterable {
    case teardown
  }
}
