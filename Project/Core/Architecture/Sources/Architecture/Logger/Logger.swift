import Foundation
import Domain
import Logging

fileprivate let logging = Logging.Logger(label: "com.myCompany.authenticationpreviews.preview")

public struct Logger: Equatable {
  public static func debug(_ message: Logger.Message) {
    logging.debug(.init(stringLiteral: message.description))
  }
  
  public static func trace(_ message: Logger.Message) {
    logging.trace(.init(stringLiteral: message.description))
  }
  
  public static func error(_ message: Logger.Message) {
    logging.error(.init(stringLiteral: message.description))
  }
  
  public static func error(_ error: CompositeErrorRepository) {
    logging.error(.init(stringLiteral: error.message))
  }
}

extension Logger {
  public struct Message: ExpressibleByStringLiteral, Equatable, CustomStringConvertible, ExpressibleByStringInterpolation {
    public typealias StringLiteralType = String
    
    private var value: String
    
    public init(stringLiteral value: String) {
      self.value = value
    }
    
    public var description: String {
      return self.value
    }
  }
}

