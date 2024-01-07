// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let timezone = try? newJSONDecoder().decode(Timezone.self, from: jsonData)

import Foundation

// MARK: - Timezone
struct Timezone: Codable {
    let offset, description: String
}
