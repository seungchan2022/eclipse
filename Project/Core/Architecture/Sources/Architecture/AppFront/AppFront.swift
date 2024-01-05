import SwiftUI

public struct AppFrontView {
  let viewModel: ToastViewModel
  
  public init(viewModel: ToastViewModel) {
    self.viewModel = viewModel
  }
}

extension AppFrontView: View {
  public var body: some View {
    ZStack {
      Toast(message: viewModel.message, toastType: .default)
        .onTapGesture {
          viewModel.clear()
        }
      
      Toast(message: viewModel.errorMessage, toastType: .error)
        .onTapGesture {
          viewModel.clear()
        }
    }
  }
}
