//
//  UserModel.swift
//  BlackCatSDK
//
//  Created by 김지훈 on 2022/11/30.
//

import Foundation

extension Model {
    public enum Gender: Codable {
        case 남자, 여자
    }
    
    public enum Area: Codable {
        case 서울, 경기, 인천, 충청_대전, 전라_광주, 경북_대구, 경남_부산_울산, 강원, 제주
    }
    
    public enum UserType: Codable {
        case none
        case guest
        case normal
        case business
    }
    
    public struct User: Codable {
        public var id: Int
        public var jwt: String?
        public var name: String?
        public var imageUrl: String?
        public var email: String?
        public var phoneNumber: String?
        public var gender: Gender?
        public var area: Area?
        public var userType: UserType
        public init(id: Int,
                    jwt: String? = nil,
                    name: String? = nil,
                    imageUrl: String? = nil,
                    email: String? = nil,
                    phoneNumber: String? = nil,
                    gender: Gender? = nil,
                    area: Area? = nil,
                    userType: UserType = .none
        ) {
            self.id = id
            self.jwt = jwt
            self.name = name
            self.imageUrl = imageUrl
            self.email = email
            self.phoneNumber = phoneNumber
            self.gender = gender
            self.area = area
            self.userType = userType
        }
    }
    
}
