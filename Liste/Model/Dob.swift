// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let dob = try? newJSONDecoder().decode(Dob.self, from: jsonData)

import Foundation

// MARK: - Dob
struct Dob: Codable {
    let date: String
    let age: Int
}
