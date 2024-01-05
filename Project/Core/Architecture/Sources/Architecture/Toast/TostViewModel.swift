import Foundation
import Functor
  
@Observable
public final class ToastViewModel {
  
  public var message: String
  public var errorMessage: String
  public var changeAction: ((Bool) -> Void)?
  
  private let defaultEvent = DebounceFunctor(delay: 2.5)
  private let errorEvent = DebounceFunctor(delay: 2.5)
  
  public init(
    message: String = "",
    errorMessage: String = "")
  {
    self.message = message
    self.errorMessage = errorMessage
  }
  
  deinit {
    Logger.trace("ToastViewModel deinit...")
    clear()
  }
}

extension ToastViewModel {
  public func send(message: String) {
    DispatchQueue.main.async { [weak self] in
      guard let self else { return }
      changeAction?(true)
      self.message = message
      
      defaultEvent.run {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
          self.changeAction?(false)
        }
        
        self.message = ""
      }
    }
  }
  
  public func send(errorMessage: String) {
    DispatchQueue.main.async { [weak self] in
      guard let self else { return }
      self.errorMessage = errorMessage
      changeAction?(true)
      
      defaultEvent.run {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
          self.changeAction?(false)
        }
        
        self.errorMessage = ""
      }
    }
  }
  
  public func clear() {
    defaultEvent.cacel()
    errorEvent.cacel()
    
    message = ""
    errorMessage = ""
    
    self.changeAction?(false)
  }
}
