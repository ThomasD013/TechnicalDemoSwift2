import Foundation

enum Postcode: Codable {
    case integer(Int)
    case string(String)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let intValue = try? container.decode(Int.self) {
            self = .integer(intValue)
            return
        }
        if let stringValue = try? container.decode(String.self) {
            self = .string(stringValue)
            return
        }
        let description: String = "Wrong type for Postcode"
        throw DecodingError.typeMismatch(Postcode.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: description))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .integer(let intValue):
            try container.encode(intValue)
        case .string(let stringValue):
            try container.encode(stringValue)
        }
    }
}
