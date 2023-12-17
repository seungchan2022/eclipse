import Foundation

extension Link {
  public enum Authentication { }
}

extension Link.Authentication {
  public enum Path: String, Equatable {
    case signIn
    case signUp
  }
}
