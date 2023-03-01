//
//  TattooistIntroduceModel.swift
//  BlackCatSDK
//
//  Created by 김지훈 on 2023/02/06.
//

import Foundation

extension Model {
    public struct TattooistIntroduce: Equatable, Codable {
        
        public let profileId: Int
        public var introduce: String
        public let userImageUrlString: String?
        public let userName: String?
        public let addressId: Int?
        public var imageUrlString: String?
        
        public init(
            profileId: Int = -1,
            introduce: String,
            userImageUrlString: String? = nil,
            userName: String? = nil,
            addressId: Int? = nil,
            imageUrlString: String? = nil
        ) {
            self.profileId = profileId
            self.introduce = introduce
            self.userImageUrlString = userImageUrlString
            self.userName = userName
            self.addressId = addressId
            self.imageUrlString = imageUrlString
        }
    }
}
