//
//  Tattoo.swift
//  BlackCatSDK
//
//  Created by SeYeong on 2022/11/09.
//

import Foundation

extension Model {
    public struct Tattoo {
        public let id: Int
        public let price: Int
        public let description: String
        public let liked: Bool
        public let imageURLStrings: [String?]
        public let address: String
    }
}
