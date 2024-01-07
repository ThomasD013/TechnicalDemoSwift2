// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let street = try? newJSONDecoder().decode(Street.self, from: jsonData)

import Foundation

// MARK: - Street
struct Street: Codable {
    let number: Int
    let name: String
}
