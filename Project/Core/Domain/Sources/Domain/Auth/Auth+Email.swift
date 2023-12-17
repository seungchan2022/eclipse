import Foundation

extension Auth {
  public enum Email { }
}

extension Auth.Email {
  public struct Request: Equatable, Codable {
    public let content: String
    public let password: String
    
    public init(content: String, password: String) {
      self.content = content
      self.password = password
    }
  }
}
