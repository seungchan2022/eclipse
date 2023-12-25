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
        
      case .onTapSignIn:
        return env.signIn(state)
          .cancellable(pageID: pageID, id: CancelID.requestSignIn, cancelInFlight: true)
                
      case .fetchSignIn(let result):
        switch result {
        case .success:
          env.routeToHome()
          print("OK")
          return .none
          
        case .failure(let error):
          return .run { await $0(.throwError(error))}
        }
        
      case .routeToSignUp:
        env.routeToSignUp()
        return .none
        
      case .throwError(let error):
        print(error)
        return .none
      }
    }
  }
}

extension SignInStore {
  struct State: Equatable {
    init(injectionItem: Auth.Email.Request?) {
      _fetchSignIn = .init(.init(isLoading: false))
      
      email = injectionItem?.content ?? ""
      password = injectionItem?.password ?? ""
    }
    
    @Heap var fetchSignIn: FetchState.Empty
    @BindingState var email = ""
    @BindingState var password = ""
  }
}

extension SignInStore { 
  enum Action: Equatable, BindableAction {
    case binding(BindingAction<State>)
    case teardown
    
    case onTapSignIn
    
    case fetchSignIn(Result<Auth.Email.Request, CompositeErrorRepository>)
    
    case routeToSignUp
    
    case throwError(CompositeErrorRepository)
  }
}

extension SignInStore {
  enum CancelID: Equatable, CaseIterable {
    case teardown
    case requestSignIn
  }
}
