//
//  Tattoo.swift
//  BlackCatSDK
//
//  Created by SeYeong on 2022/11/09.
//

import Foundation

extension Model {
    public struct Tattoo: Codable, Hashable {
        public let id: Int
        public let price: Int
        public let description: String
        public let liked: Bool
        public let imageURLStrings: [String]
        public let address: String

        public static let empty: Tattoo = .init(id: 0, price: 0, description: "", liked: true, imageURLStrings: [], address: "")
    }
}
