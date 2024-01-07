// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let picture = try? newJSONDecoder().decode(Picture.self, from: jsonData)

import Foundation

// MARK: - Picture
struct Picture: Codable {
    let large, medium, thumbnail: String
}
