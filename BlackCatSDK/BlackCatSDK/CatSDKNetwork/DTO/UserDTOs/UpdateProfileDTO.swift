//
//  UpdateProfileDTO.swift
//  BlackCatSDK
//
//  Created by 김지훈 on 2023/01/31.
//

import Foundation
import Moya

extension DTO.User {
    public struct UpdateProfile {
        public struct Request: Encodable {
            let userInfo: UserInfo
            let imageDataList: [Data]?
        }
        
        struct Response: Decodable {
            let name: String
            let email: String
            let phoneNumber: String
            let gender: String
            let addressId: Int
            let imageUrl: [String]
        }
        
        struct UserInfo: Codable {
            let name: String
            let email: String
            let phoneNumber: String
            let gender: String
            let addressId: Int
            let deleteImageUrls: [String]
        }
    }
}
