import SwiftUI

// MARK: - DesignSystemNavigation

public struct DesignSystemNavigation<Content: View> {
  let barItem: DesignSystemNavigationBar?
  let content: Content
  
  public init(
    barItem: DesignSystemNavigationBar? = .none,
    @ViewBuilder content: @escaping () -> Content)
  {
    self.barItem = barItem
    self.content = content()
  }
}

// MARK: View

extension DesignSystemNavigation: View {
  public var body: some View {
    VStack(alignment: .leading) {
      if let barItem {
        barItem
          .padding(.horizontal, 16)
      }
      ScrollView {
          content
            .padding(.top, 16)
            .frame(maxWidth: .infinity, alignment: .leading)
      }
    }
    .frame(minWidth: .zero, maxWidth: .infinity)
    .frame(minHeight: .zero, maxHeight: .infinity)
  }
}

#Preview {
  DesignSystemNavigation(
    barItem: .init(
      actionItem: .init(title: "UserName", action: { }),
      moreActionList: [
        .init(title: "1", image: DesignSystemIcon.arrow.image, action: {}),
        .init(title: "2", image: DesignSystemIcon.delete.image, action: {}),
      ])) {
        ForEach(0..<100) { _ in
        Text("dd")
        }
      }
}
