// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let name = try? newJSONDecoder().decode(Name.self, from: jsonData)

import Foundation

// MARK: - Name
struct Name: Codable {
    let title, first, last: String
}
