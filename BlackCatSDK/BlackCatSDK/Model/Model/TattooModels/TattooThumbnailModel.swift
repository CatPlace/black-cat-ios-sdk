//
//  TattooThumbnailModel.swift
//  BlackCatSDK
//
//  Created by 김지훈 on 2023/02/06.
//

import Foundation

extension Model {
    public struct TattooThumbnail: Equatable, Codable {
        public let tattooId: Int
        public let imageUrlString: String
        
        public init(tattooId: Int, imageUrlString: String) {
            self.tattooId = tattooId
            self.imageUrlString = imageUrlString
        }
    }
}
