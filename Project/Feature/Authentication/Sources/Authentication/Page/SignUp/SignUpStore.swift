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
        return .concatenate(
          CancelID.allCases.map { .cancel(pageID: pageID, id: $0 )})
        
      case .onTapSignUp:
        return env.signUp(state)
          .cancellable(pageID: pageID, id: CancelID.requestSignUp, cancelInFlight: true)
        
      case .fetchSignUp(let result):
        switch result {
        case .success:
          env.routeToSignIn()
          print("Succeed Sign Up")
          return .none
          
        case .failure(let error):
          return .run { await $0(.throwError(error) )}
        }
        
      case .routeToSignIn:
        env.routeToSignIn()
        return .none
        
      case .throwError(let error):
        print(error)
        return .none
        
      }
    }
  }
}

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

extension SignUpStore {
  enum CancelID: Equatable, CaseIterable {
    case teardown
    case requestSignUp
  }
}
