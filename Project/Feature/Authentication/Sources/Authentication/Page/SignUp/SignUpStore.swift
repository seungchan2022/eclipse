import Architecture
import Foundation
import Domain
import ComposableArchitecture

struct SignUpStore {
  let env: SignUpEnvType
  let pageID = UUID().uuidString
}

extension SignUpStore: Reducer {
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

extension SignUpStore {
  struct State: Equatable {
  }
}

extension SignUpStore { 
  enum Action: Equatable, BindableAction {
    case binding(BindingAction<State>)
    case teardown
    
  }
}

extension SignUpStore {
  enum CancelID: Equatable, CaseIterable {
    case teardown
  }
}
