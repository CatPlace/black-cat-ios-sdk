//
//  UserModel.swift
//  BlackCatSDK
//
//  Created by 김지훈 on 2022/11/30.
//

import Foundation

extension Model {
    public struct User {
        public let jwt: String
        public let name: String
        public let imageUrl: String
        
        public init(jwt: String, name: String, imageUrl: String) {
            self.jwt = jwt
            self.name = name
            self.imageUrl = imageUrl
        }
    }
    
}
