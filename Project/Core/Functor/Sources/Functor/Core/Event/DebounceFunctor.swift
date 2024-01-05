import Foundation

public class DebounceFunctor {
  
  public init(delay: TimeInterval,  queue: DispatchQueue = .main) {
    self.delay = delay
    self.queue = queue
  }
  
  private let delay: TimeInterval
  private var workItem: DispatchWorkItem?
  private let queue: DispatchQueue
}

extension DebounceFunctor {
  public func run(action: @escaping () -> Void) {
    workItem?.cancel()
    let workItem = DispatchWorkItem(block: action)
    queue.asyncAfter(deadline: .now() + delay, execute: workItem)
    self.workItem = workItem
  }
  
  public func cacel() {
    workItem?.cancel()
  }
}
 
