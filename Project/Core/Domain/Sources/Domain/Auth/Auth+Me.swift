import Foundation

extension Auth {
  public enum Me { }
}

extension Auth.Me {
  public struct Response: Equatable, Codable {
    public let uid: String
    public let email: String?
    public let photoURL: String?
    
    public init(
      uid: String,
      email: String?,
      photoURL: String?)
    {
      self.uid = uid
      self.email = email
      self.photoURL = photoURL
    }
  }
}
