// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let login = try? newJSONDecoder().decode(Login.self, from: jsonData)

import Foundation

// MARK: - Login
struct Login: Codable {
    let uuid, username, password, salt: String
    let md5, sha1, sha256: String
}
