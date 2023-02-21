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
        public let profileId: Int
        public let ownerName: String
        public let description: String
        public let address: String
        public let imageURLStrings: [String]
        public let tattooType: TattooType
        public let categoryIds: [Int]
        public let likeCount: Int?
        public let createDate: String?
        public let profileImageUrls: String?

        public static let empty: Tattoo = .init(id: 0)

        public init(
            id: Int,
            title: String = "",
            price: Int = 0,
            ownerId: Int = -1,
            profileId: Int = -1,
            ownerName: String = "",
            description: String = "",
            address: String = "",
            imageURLStrings: [String] = [],
            tattooType: TattooType = .work,
            categoryIds: [Int] = [],
            likeCount: Int? = nil,
            createDate: String? = nil,
            profileImageUrls: String? = nil
        ) {
            self.id = id
            self.title = title
            self.price = price
            self.ownerId = ownerId
            self.profileId = profileId
            self.ownerName = ownerName
            self.description = description
            self.address = address
            self.imageURLStrings = imageURLStrings
            self.tattooType = tattooType
            self.categoryIds = categoryIds
            self.likeCount = likeCount
            self.createDate = createDate
            self.profileImageUrls = profileImageUrls
        }
    }
}
