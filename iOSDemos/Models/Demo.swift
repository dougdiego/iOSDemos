//
//  Demo.swift
//  iOSDemos
//
//  Created by Doug Diego on 3/16/18.
//  Copyright © 2018 Doug Diego. All rights reserved.
//

import Foundation

typealias Demos = [Demo]

struct Demo: Codable {
    let title: String
    let viewController: String
    let description: String

    enum CodingKeys: String, CodingKey {
        case title = "title"
        case viewController = "viewController"
        case description = "description"
    }
}

// MARK: Convenience initializers

extension Demo {
    init(data: Data) throws {
        self = try JSONDecoder().decode(Demo.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }
    
    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

extension Array where Element == Demos.Element {
    init(data: Data) throws {
        self = try JSONDecoder().decode(Demos.self, from: data)
    }

    init(_ json: String, using encoding: String.Encoding = .utf8) throws {
        guard let data = json.data(using: encoding) else {
            throw NSError(domain: "JSONDecoding", code: 0, userInfo: nil)
        }
        try self.init(data: data)
    }

    init(fromURL url: URL) throws {
        try self.init(data: try Data(contentsOf: url))
    }

    func jsonData() throws -> Data {
        return try JSONEncoder().encode(self)
    }

    func jsonString(encoding: String.Encoding = .utf8) throws -> String? {
        return String(data: try self.jsonData(), encoding: encoding)
    }
}

