// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let location = try? newJSONDecoder().decode(Location.self, from: jsonData)

import Foundation

// MARK: - Location
struct Location: Codable {
    let street: Street
    let city, state, country: String
    let postcode: Postcode
    let coordinates: Coordinates
    let timezone: Timezone
}
