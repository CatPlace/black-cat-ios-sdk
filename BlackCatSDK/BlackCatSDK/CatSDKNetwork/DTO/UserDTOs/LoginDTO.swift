//
//  LoginDTO.swift
//  BlackCatSDK
//
//  Created by 김지훈 on 2022/11/18.
//

import Foundation

extension DTO.User {
    public struct Login {
        public struct Request: Encodable {
            let providerType: String
            let providerToken: String
        }
        
        struct Response: Decodable {
            let userId: Int
            let accessToken: String
            let role: String
        }
    }
}
