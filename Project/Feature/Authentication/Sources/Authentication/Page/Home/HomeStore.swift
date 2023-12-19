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
        return .concatenate(
          CancelID.allCases.map { .cancel(pageID: pageID, id: $0 )})
        
      case .onTapSignOut:
        return env.signOut()
          .cancellable(pageID: pageID, id: CancelID.requestSignOut, cancelInFlight: true)
        
      case .fetchSignOut(let result):
        switch result {
        case .success:
          env.routeToSignIn()
          print("Succeed SignOut")
          return .none
          
        case .failure(let error):
          return .run { await $0(.throwError(error) )}
        }
        
      case .throwError(let error):
        print(error)
        return .none
      }
    }
  }
}

extension HomeStore {
  struct State: Equatable {
    init() {
      _fetchSignOut = .init(.init(isLoading: false))
    }
    
    @Heap var fetchSignOut: FetchState.Empty
    
  }
}

extension HomeStore {
  enum Action: Equatable, BindableAction {
    case binding(BindingAction<State>)
    case teardown
    
    case onTapSignOut
    
    case fetchSignOut(Result<Bool, CompositeErrorRepository>)
    
    case throwError(CompositeErrorRepository)
  }
}

extension HomeStore { 
  enum CancelID: Equatable, CaseIterable {
    case teardown
    case requestSignOut
  }
}
