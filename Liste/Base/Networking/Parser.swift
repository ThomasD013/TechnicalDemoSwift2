//
//  Parser.swift
//  Liste
//
//  Created by Thomas Dutartre on 07/01/2024.
//

import Foundation

enum Parser {
    static func readLocalJSONFile(forName name: String) throws -> Data? {
        if let fileUrl = Bundle.main.url(forResource: name, withExtension: "json") {
            let data = try Data(contentsOf: fileUrl)

            return data
        }

        return nil
    }

    static func parse<T: Codable>(jsonData: Data, type: T.Type) throws -> T? {
        let decodedData = try JSONDecoder().decode(T.self, from: jsonData)

        return decodedData
    }

    static func loadMock<T: Codable>(fileName: String, type: T.Type) throws -> T? {
        if let data = try Parser.readLocalJSONFile(forName: fileName),
            let item = try Parser.parse(jsonData: data, type: type) {
            return item
        }

        return nil
    }
}
