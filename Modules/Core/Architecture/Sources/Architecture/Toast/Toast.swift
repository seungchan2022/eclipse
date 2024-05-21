import DesignSystem
import SwiftUI

// MARK: - Toast

public struct Toast {

  private let message: String
  private let toastType: ToastType

  public init(
    message: String,
    toastType: ToastType)
  {
    self.message = message
    self.toastType = toastType
  }

}

// MARK: Toast.ToastType

extension Toast {
  public enum ToastType: Equatable {
    case `default`
    case error

    var backgroudColor: Color {
      switch self {
      case .default:
        DesignSystemColor.overlay(.default).color
      case .error:
        DesignSystemColor.error(.default).color
      }
    }
  }
}

// MARK: View

extension Toast: View {
  public var body: some View {
    VStack {
      Spacer()

      if !message.isEmpty {
        HStack {
          Text(message)
            .font(.system(size: 16))
            .foregroundStyle(.white)
            .padding(16)
        }
        .frame(maxWidth: .infinity)
        .background(toastType.backgroudColor)
        .clipShape(RoundedRectangle(cornerRadius: 4))
        .padding(.horizontal, 16)
      }
    }
    .padding(.bottom, 40)
    .transition(.opacity)
    .animation(.spring(), value: message.isEmpty)
  }
}
