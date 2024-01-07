// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let coordinates = try? newJSONDecoder().decode(Coordinates.self, from: jsonData)

import Foundation

// MARK: - Coordinates
struct Coordinates: Codable {
    let latitude, longitude: String
}
