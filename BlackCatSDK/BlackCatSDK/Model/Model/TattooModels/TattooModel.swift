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
        public let ownerName: String
        public let price: Int
        public let description: String
        public let liked: Bool
        public let imageURLStrings: [String]
        public let address: String

        public static let empty: Tattoo = .init(id: 0, ownerName: "", price: 0, description: "", liked: true, imageURLStrings: [], address: "")
        
        public init(id: Int, ownerName: String, price: Int, description: String, liked: Bool, imageURLStrings: [String], address: String) {
            self.id = id
            self.ownerName = ownerName
            self.price = price
            self.description = description
            self.liked = liked
            self.imageURLStrings = imageURLStrings
            self.address = address
        }
    }
}
