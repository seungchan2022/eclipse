import Architecture
import SwiftUI
import LinkNavigator

final class SceneDelegate: NSObject, UIWindowSceneDelegate {
  
  var keyWindow: UIWindow?
  var toastWindow: UIWindow?
  
  func scene(
    _ scene: UIScene,
    willConnectTo session: UISceneSession,
    options connectionOptions: UIScene.ConnectionOptions)
  {
    guard let root = scene as? UIWindowScene else { return }
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
    
    /// - Note: 에어플레이 또는 USB 연결시, 화면이 분리되는 현상제거. (Screen Mirroring)
    guard session.role != .windowExternalDisplayNonInteractive else { return }
    
    toastWindow = root.buildForToastView(toastViewModel: appDelegate.dependency.toastViewModel)
    keyWindow = root.buildForKeyWindow(linkNavigator: appDelegate.navigator)
    
    appDelegate.dependency.toastViewModel.changeAction = { [weak self] isToastKeyWindow in
      self?.toastWindow?.isHidden = !isToastKeyWindow
    }
  }
}

extension UIWindowScene {
  fileprivate func buildForToastView(toastViewModel: ToastViewModel) -> UIWindow {
    let window = PassThroughWindow(windowScene: self)
    let viewController = UIHostingController(rootView: AppFrontView(viewModel: toastViewModel))
    viewController.view.backgroundColor = .clear
    window.rootViewController = viewController
    window.isUserInteractionEnabled = true
    return window
  }
  
  fileprivate func buildForKeyWindow(linkNavigator: SingleLinkNavigator) -> UIWindow {
    let window = UIWindow(windowScene: self)
    let rootView = AppMain(viewModel: .init(linkNavigator: linkNavigator))
    window.rootViewController = UIHostingController(rootView: rootView)
    window.makeKeyAndVisible()
    return window
  }
}

/// - Note: 토스트 노출시, 전체 화면 블랙 번 현상 제어하는 윈도우
fileprivate class PassThroughWindow: UIWindow {
  override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
    guard let hitView = super.hitTest(point, with: event) else { return nil }
    return rootViewController?.view == hitView ? nil : hitView
  }
}