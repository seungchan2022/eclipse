import SwiftUI

public enum DesignSystemIcon {

  case arrow
  case back
  case bell
  case memo
  case mic
  case setting
  case timer
  case todo
  case pencil
  case unChecked
  case checked
  case delete
  
  case plus
  case more
  case profile
  case find
  case avatar
  case grid
  case play
  case person

  // MARK: Public

  public var image: Image {
    var image: Image {
      switch self {
      case .arrow: Asset.Icon.icArrow.swiftUIImage
      case .back: Asset.Icon.icBack.swiftUIImage
      case .bell: Asset.Icon.icBell.swiftUIImage
      case .memo: Asset.Icon.icMemo.swiftUIImage
      case .mic: Asset.Icon.icMic.swiftUIImage
      case .setting: Asset.Icon.icSetting.swiftUIImage
      case .timer: Asset.Icon.icTimer.swiftUIImage
      case .todo: Asset.Icon.icTodo.swiftUIImage
      case .pencil: Image(systemName: "pencil")
      case .unChecked: Image(systemName: "rectangle")
      case .checked: Image(systemName: "checkmark.rectangle")
      case .delete: Image(systemName: "trash")
      case .plus: Image(systemName: "plus.square")
      case .more: Image(systemName: "line.3.horizontal")
      case .profile: Image(systemName: "person.crop.circle")
      case .find: Image(systemName: "person.badge.plus")
      case .avatar: Image(systemName: "theatermasks.circle")
      case .grid: Image(systemName: "squareshape.split.3x3")
      case .play: Image(systemName: "play.rectangle")
      case .person: Image(systemName: "person.crop.rectangle")
      }
    }

    return image.renderingMode(.template)
  }

}
