//
//  PostTattooModel.swift
//  BlackCatSDK
//
//  Created by SeYeong on 2022/12/14.
//

import Foundation

extension Model {
    public struct PostTattoo {
        public struct Response {
            public let tattooId: Int
            public let imageUrls: [String]
        }

        public struct Request {
            public let tattooType: String
            public let categoryId: Int
            public let title: String
            public let price: Int
            public let description: String
        }
    }
}
