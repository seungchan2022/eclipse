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
        
      case .onTapSignInEmail:
        return env.signInEmail(state)
          .cancellable(pageID: pageID, id: CancelID.requestSignInEmail, cancelInFlight: true)
        
      case .onTapSignInGoogle:
        return env.signInGoogle()
          .cancellable(pageID: pageID, id: CancelID.requestSignInGoogle, cancelInFlight: true)
                
      case .fetchSignInEmail(let result):
        switch result {
        case .success:
          env.routeToHome()
          print("OK")
          return .none
          
        case .failure(let error):
          return .run { await $0(.throwError(error))}
        }
        
      case .fetchSignInGoogle(let result):
        switch result {
        case .success:
          env.routeToHome()
          print("Success Google Sign In")
          return .none
          
        case .failure(let error):
          return .run { await $0(.throwError(error)) }
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
      _fetchSignInEmail = .init(.init(isLoading: false))
      _fetchSignInGoogle = .init(.init(isLoading: false))
      
      email = injectionItem?.content ?? ""
      password = injectionItem?.password ?? ""
    }
    
    @Heap var fetchSignInEmail: FetchState.Empty
    @Heap var fetchSignInGoogle: FetchState.Empty
    
    @BindingState var email = ""
    @BindingState var password = ""
  }
}

extension SignInStore { 
  enum Action: Equatable, BindableAction {
    case binding(BindingAction<State>)
    case teardown
    
    case onTapSignInEmail
    case onTapSignInGoogle
    
    case fetchSignInEmail(Result<Auth.Email.Request, CompositeErrorRepository>)
    case fetchSignInGoogle(Result<Bool, CompositeErrorRepository>)
    
    case routeToSignUp
    
    case throwError(CompositeErrorRepository)
  }
}

extension SignInStore {
  enum CancelID: Equatable, CaseIterable {
    case teardown
    case requestSignInEmail
    case requestSignInGoogle
  }
}


//var signInTest: () -> Effect<SignInStore.Action> {
//  {
//    .publisher {
//      useCaseGroup.authUseCase
//        .me()
////          .signOut()
////          .signInViaEmail(.init(content: "test@test.com", password: "123123"))
//        .map { _ in true }
//        .mapToResult()
//        .receive(on: mainQueue)
//        .map(SignInStore.Action.fetchTest)
//    }
//  }
//}
