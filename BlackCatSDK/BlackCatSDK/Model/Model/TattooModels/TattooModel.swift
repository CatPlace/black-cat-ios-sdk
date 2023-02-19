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
        public let price: Int
        public let ownerId: Int
        public let ownerName: String
        public let description: String
        public let address: String
        public let imageURLStrings: [String]
        public let tattooType: TattooType
        public let categoryId: [Int]
        public let likeCount: Int?
        public let liked: Bool?
        public let createDate: String?
        public let profileImageUrls: String?

        public static let empty: Tattoo = .init(id: 0)

        public init(
            id: Int,
            title: String = "",
            price: Int = 0,
            ownerId: Int = -1,
            ownerName: String = "",
            description: String = "",
            address: String = "",
            imageURLStrings: [String] = [],
            tattooType: TattooType = .work,
            categoryId: [Int] = [],
            likeCount: Int? = nil,
            liked: Bool? = nil,
            createDate: String? = nil,
            profileImageUrls: String? = nil
        ) {
            self.id = id
            self.title = title
            self.price = price
            self.ownerId = ownerId
            self.ownerName = ownerName
            self.description = description
            self.address = address
            self.imageURLStrings = imageURLStrings
            self.tattooType = tattooType
            self.categoryId = categoryId
            self.likeCount = likeCount
            self.liked = liked
            self.createDate = createDate
            self.profileImageUrls = profileImageUrls
        }
    }
}
