//
//  TattooDetailModel.swift
//  BlackCatSDK
//
//  Created by 김지훈 on 2023/02/06.
//

import Foundation

extension Model {
    public struct TattooDetail: Codable, Hashable {
        public let id: Int
        public let ownerName: String
        public let price: Int
        public let description: String
        public let liked: Bool
        public let imageURLStrings: [String]
        public let address: String
        public let ownerId: Int
        public let tattooType: String
        public let categoryId: Int
        public let likeCount: Int
        
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
            categoryId: Int,
            likeCount: Int
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
