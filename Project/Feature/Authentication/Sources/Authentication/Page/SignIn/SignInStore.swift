import Foundation
import Architecture
import Domain
import ComposableArchitecture

struct SignInStore {
  let env: SignInEnvType
  let pageID = UUID().uuidString
}

extension SignInStore: Reducer {
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

extension SignInStore {
  struct State: Equatable {
    
  }
}

extension SignInStore { 
  enum Action: Equatable, BindableAction {
    case binding(BindingAction<State>)
    case teardown
  }
}

extension SignInStore {
  enum CancelID: Equatable, CaseIterable {
    case teardown
  }
}
