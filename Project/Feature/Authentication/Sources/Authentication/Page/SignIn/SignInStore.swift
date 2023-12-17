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
        
      case .test:
        return env.signInTest()
          .cancellable(pageID: pageID, id: CancelID.requestTest, cancelInFlight: true)
        
      case .fetchTest(let result):
        switch result {
        case .success:
          print("OK")
          return .none
          
        case .failure(let error):
          return .run { await $0(.throwError(error))}
        }
        
      case .throwError(let error):
        print(error)
        return .none
      }
    }
  }
}

extension SignInStore {
  struct State: Equatable {
    init() {
      _fetchTest = .init(.init(isLoading: false))
    }
    
    @Heap var fetchTest: FetchState.Empty
  }
}

extension SignInStore { 
  enum Action: Equatable, BindableAction {
    case binding(BindingAction<State>)
    case teardown
    
    case test
    case fetchTest(Result<Bool, CompositeErrorRepository>)
    case throwError(CompositeErrorRepository)
  }
}

extension SignInStore {
  enum CancelID: Equatable, CaseIterable {
    case teardown
    case requestTest
  }
}
