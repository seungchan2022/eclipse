import Foundation

// MARK: - Auth.Email

extension Auth {
  public enum Email { }
}

// MARK: - Auth.Email.Request

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
