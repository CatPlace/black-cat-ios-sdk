//
//  Tattoo.swift
//  BlackCatSDK
//
//  Created by SeYeong on 2022/11/09.
//

import Foundation

public enum TattooType: String, CaseIterable, Codable {
    case work = "WORK"
    case design = "DESIGN"
}

extension Model {
    public struct Tattoo: Codable, Hashable {
        public let id: Int
        public let title: String
        public let ownerName: String
        public let price: Int
        public let description: String
        public let liked: Bool
        public let imageURLStrings: [String]
        public let address: String
        public let ownerId: Int
        public let tattooType: TattooType
        public let categoryId: [Int]
        public let likeCount: Int?
        
        public static let empty: Tattoo = .init(id: 0)
        
        public init(
            id: Int,
            title: String = "",
            ownerName: String = "",
            price: Int = 0,
            description: String = "",
            liked: Bool = false,
            imageURLStrings: [String] = [],
            address: String = "",
            ownerId: Int = 0,
            tattooType: TattooType = .work,
            categoryId: [Int] = [],
            likeCount: Int? = nil
        ) {
            self.id = id
            self.title = title
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
