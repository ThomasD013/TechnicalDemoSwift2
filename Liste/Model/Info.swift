// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let info = try? newJSONDecoder().decode(Info.self, from: jsonData)

import Foundation

// MARK: - Info
struct Info: Codable {
    let seed: String
    let results, page: Int
    let version: String
}
