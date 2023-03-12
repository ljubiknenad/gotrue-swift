// Generated by Create API
// https://github.com/CreateAPI/CreateAPI

import Foundation
import Get
import URLQueryEncoder

internal enum Paths {}

extension Paths {
  internal static var token: Token {
    Token(path: "/token")
  }

  internal struct Token {
    /// Path: `/token`
    internal let path: String

    internal func post(
      grantType: GrantType,
      redirectTo: URL? = nil,
      _ body: PostRequest
    ) -> Request<GoTrue.Session> {
      Request(method: "POST", url: path, query: makePostQuery(grantType, redirectTo), body: body)
    }

    private func makePostQuery(_ grantType: GrantType, _ redirectTo: URL?) -> [(String, String?)] {
      let encoder = URLQueryEncoder()
      encoder.encode(grantType, forKey: "grant_type")
      encoder.encode(redirectTo, forKey: "redirect_to")
      return encoder.items
    }

    internal enum GrantType: String, Codable, CaseIterable {
      case password
      case refreshToken = "refresh_token"
      case idToken = "id_token"
      case pkce = "oauth_pkce"
    }

    internal enum PostRequest: Encodable, Equatable {
      case userCredentials(GoTrue.UserCredentials)
      case openIDConnectCredentials(GoTrue.OpenIDConnectCredentials)
      case codeVerifier(GoTrue.PKCECodeVerifier)

      internal func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case let .userCredentials(value): try container.encode(value)
        case let .openIDConnectCredentials(value): try container.encode(value)
        case let .codeVerifier(value): try container.encode(value)
        }
      }
    }
  }
}

extension Paths {
  internal static var signup: Signup {
    Signup(path: "/signup")
  }

  internal struct Signup {
    /// Path: `/signup`
    internal let path: String

    internal func post(
      redirectTo: URL? = nil,
      _ body: GoTrue.SignUpRequest
    ) -> Request<GoTrue.AuthResponse> {
      Request(method: "POST", url: path, query: makePostQuery(redirectTo), body: body)
    }

    private func makePostQuery(_ redirectTo: URL?) -> [(String, String?)] {
      let encoder = URLQueryEncoder()
      encoder.encode(redirectTo, forKey: "redirect_to")
      return encoder.items
    }
  }
}

extension Paths {
  internal static var otp: Otp {
    Otp(path: "/otp")
  }

  internal struct Otp {
    /// Path: `/otp`
    internal let path: String

    internal func post(redirectTo: URL? = nil, _ body: GoTrue.OTPParams) -> Request<Void> {
      Request(method: "POST", url: path, query: makePostQuery(redirectTo), body: body)
    }

    private func makePostQuery(_ redirectTo: URL?) -> [(String, String?)] {
      let encoder = URLQueryEncoder()
      encoder.encode(redirectTo, forKey: "redirect_to")
      return encoder.items
    }
  }
}

extension Paths {
  internal static var verify: Verify {
    Verify(path: "/verify")
  }

  internal struct Verify {
    /// Path: `/verify`
    internal let path: String

    internal func post(
      redirectTo: URL? = nil,
      _ body: GoTrue.VerifyOTPParams
    ) -> Request<GoTrue.AuthResponse> {
      Request(method: "POST", url: path, query: makePostQuery(redirectTo), body: body)
    }

    private func makePostQuery(_ redirectTo: URL?) -> [(String, String?)] {
      let encoder = URLQueryEncoder()
      encoder.encode(redirectTo, forKey: "redirect_to")
      return encoder.items
    }
  }
}

extension Paths {
  internal static var user: User {
    User(path: "/user")
  }

  internal struct User {
    /// Path: `/user`
    internal let path: String

    internal var get: Request<GoTrue.User> {
      Request(method: "GET", url: path)
    }

    internal func put(_ body: GoTrue.UserAttributes) -> Request<GoTrue.User> {
      Request(method: "PUT", url: path, body: body)
    }
  }
}

extension Paths {
  internal static var logout: Logout {
    Logout(path: "/logout")
  }

  internal struct Logout {
    /// Path: `/logout`
    internal let path: String

    internal var post: Request<Void> {
      Request(method: "POST", url: path)
    }
  }
}

extension Paths {
  internal static var recover: Recover {
    Recover(path: "/recover")
  }

  internal struct Recover {
    /// Path: `/recover`
    internal let path: String

    internal func post(redirectTo: URL? = nil, _ body: GoTrue.RecoverParams) -> Request<Void> {
      Request(method: "POST", url: path, query: makePostQuery(redirectTo), body: body)
    }

    private func makePostQuery(_ redirectTo: URL?) -> [(String, String?)] {
      let encoder = URLQueryEncoder()
      encoder.encode(redirectTo, forKey: "redirect_to")
      return encoder.items
    }
  }
}

