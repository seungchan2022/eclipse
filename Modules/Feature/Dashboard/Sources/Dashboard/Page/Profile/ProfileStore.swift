import Architecture
import SwiftUI
import ComposableArchitecture
import Domain
import Foundation
import DesignSystem

// MARK: - ProfileStore

struct ProfileStore {
  let env: ProfileEnvType
  let pageID = UUID().uuidString
}

// MARK: Reducer

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
        
      case .routeToEditor:
        env.routeToEditor()
        return .none
          
      }
    }
  }
}

// MARK: ProfileStore.State

extension ProfileStore {
  struct State: Equatable { 
  }
}

// MARK: ProfileStore.Action

extension ProfileStore {
  enum Action: Equatable, BindableAction {
    case binding(BindingAction<State>)
    case teardown
    
    case routeToEditor
  }
}

// MARK: ProfileStore.CancelID

extension ProfileStore {
  enum CancelID: Equatable, CaseIterable {
    case teardown
  }
  
  enum ProfileGridFilter: Equatable, CaseIterable, Identifiable {
    case post
    case reels
    case tag
    
    var title: String {
      switch self {
      case .post:
        return "Post"
      case .reels:
        return "Reels"
      case .tag:
        return "tag"
      }
    }
    
    var image: Image {
      switch self {
      case .post:
        return DesignSystemIcon.grid.image
      case .reels:
        return DesignSystemIcon.play.image
      case .tag:
        return DesignSystemIcon.tag.image
      }
    }
    
    var id: String {
      title
    }
  }
}
