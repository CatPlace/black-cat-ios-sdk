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
        public let ownerId: Int
        public let tattooType: String
        public let categoryId: [Int]
        public let likeCount: Int?
        
        public static let empty: Tattoo = .init(id: 0, ownerName: "", price: 0, description: "", liked: false, imageURLStrings: [], address: "", ownerId: 0, tattooType: "", categoryId: [])
        
        public init(
            id: Int,
            ownerName: String,
            price: Int,
            description: String,
            liked: Bool,
            imageURLStrings: [String],
            address: String,
            ownerId: Int,
            tattooType: String,
            categoryId: [Int],
            likeCount: Int? = nil
        ) {
            self.id = id
            self.ownerName = ownerName
            self.price = price
            self.description = description
            self.liked = liked
            self.imageURLStrings = imageURLStrings
            self.address = address
            self.ownerId = ownerId
            self.tattooType = tattooType
            self.categoryId = categoryId
            self.likeCount = likeCount
        }
    }
}
