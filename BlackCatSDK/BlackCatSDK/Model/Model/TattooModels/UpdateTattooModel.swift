//
//  UpdateTattooModel.swift
//  BlackCatSDK
//
//  Created by SeYeong on 2022/12/14.
//

import Foundation

extension Model {
    public struct UpdateTattoo {
        public struct Response {
            public let tattooId: Int
            public let imageUrls: [String]
        }
        
        public struct Request {
            public let tattooType: TattooType?
            public let categoryId: [Int]
            public let title: String
            public let price: Int?
            public let description: String
            public let deleteImageUrls: [String]
            
            public init(
                tattooType: TattooType? = nil,
                categoryId: [Int] = [],
                title: String = "",
                price: Int? = nil,
                description: String = "",
                deleteImageUrls: [String] = []
            ) {
                self.tattooType = tattooType
                self.categoryId = categoryId
                self.title = title
                self.price = price
                self.description = description
                self.deleteImageUrls = deleteImageUrls
            }
        }
    }
}
