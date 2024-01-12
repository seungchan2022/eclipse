import SwiftUI

// MARK: - DesignSystemNavigationBar

public struct DesignSystemNavigationBar {

  let actionItem: ActionItem?
  let title: String?
  let moreActionList: [MoreAction]

  public init(
    actionItem: ActionItem? = .none,
    title: String? = "",
    moreActionList: [MoreAction] = [])
  {
    self.actionItem = actionItem
    self.title = title
    self.moreActionList = moreActionList
  }
}

extension DesignSystemNavigationBar {
  var tintColor: Color {
    DesignSystemColor.system(.black).color
  }

  var maxHeight: Double { 44 }
}

// MARK: View

extension DesignSystemNavigationBar: View {

  public var body: some View {
    Rectangle()
      .fill(.white)
      .overlay(alignment: .leading) {
        if let actionItem {
          Button(action: actionItem.action) {
            if let image = actionItem.image {
              image
                .resizable()
                .frame(width: 32, height: 32)
                .foregroundColor(tintColor)
                .padding(.vertical, 5)
            } else {
              Text(actionItem.title)
                .font(.system(size: 20))
                .foregroundStyle(tintColor)
            }
          }
        } else {
          EmptyView()
        }
      }

      .overlay(alignment: .center) {
        if let title {
          Text(title)
            .font(.system(size: 20))
            .foregroundStyle(tintColor)
            .padding(.top, 5)

        } else {
          EmptyView()
        }
      }

      .overlay(alignment: .trailing) {
        HStack(spacing: 8) {
          ForEach(moreActionList, id: \.id) { item in
            Button(action: item.action) {
              if let image = item.image {
                image
                  .resizable()
                  .frame(width: 32, height: 32)
                  .foregroundColor(tintColor)
                  .padding(.vertical, 5)
              } else {
                Text(item.title)
                  .font(.system(size: 14, weight: .regular, design: .default))
                  .multilineTextAlignment(.trailing)
                  .foregroundStyle(tintColor)
                  .fixedSize(horizontal: false, vertical: true)
                  .frame(minWidth: 40)
              }
            }
          }
        }
      }
      .frame(maxWidth: .infinity)
      .frame(height: maxHeight)
  }
}

// MARK: DesignSystemNavigationBar.ActionItem

extension DesignSystemNavigationBar {
  public struct ActionItem: Equatable, Identifiable {
    let title: String
    let image: Image?
    let action: () -> Void

    public init(
      title: String,
      image: Image? = .none,
      action: @escaping () -> Void)
    {
      self.title = title
      self.image = image
      self.action = action
    }

    public var id: String { title }

    public static func == (lhs: Self, rhs: Self) -> Bool {
      lhs.title == rhs.title
    }
  }
}

// MARK: DesignSystemNavigationBar.MoreAction

extension DesignSystemNavigationBar {
  public struct MoreAction: Equatable, Identifiable {
    let title: String
    let image: Image?
    let action: () -> Void

    public init(
      title: String,
      image: Image? = .none,
      action: @escaping () -> Void)
    {
      self.title = title
      self.image = image
      self.action = action
    }

    public var id: String { title }

    public static func == (lhs: Self, rhs: Self) -> Bool {
      lhs.title == rhs.title
    }
  }
}

#Preview("Case1") {
  VStack {
    DesignSystemNavigationBar(
      actionItem: .init(
        title: "Instargram",
        action: { }),
      title: "Navigation title",
      moreActionList: [
        .init(title: "dd", image: DesignSystemIcon.arrow.image, action: { }) ,
        .init(title: "Create", action: { }),
        .init(title: "Done", action: { }),
      ])
  }
}

#Preview("Case2") {
  VStack {
    DesignSystemNavigationBar(
      title: "ddd",
      moreActionList: [
        .init(title: "d21", action: { }),
      ])
  }
}
