import Domain
import Foundation
import LinkNavigator
import Architecture

@Observable
final class AppViewModel {

  // MARK: Lifecycle
  init(linkNavigator: SingleLinkNavigator) {
    self.linkNavigator = linkNavigator
  }

  let linkNavigator: SingleLinkNavigator
}
