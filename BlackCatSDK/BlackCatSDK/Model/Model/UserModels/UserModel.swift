//
//  UserModel.swift
//  BlackCatSDK
//
//  Created by 김지훈 on 2022/11/30.
//

import Foundation

extension Model {
    public enum Gender: Int, Codable, CaseIterable {
        case 남자, 여자
        
        public func asString() -> String {
            switch self {
            case .남자:
                return "남자"
            case .여자:
                return "여자"
            }
        }
    }
    
    public enum Area: Int, Codable, CaseIterable {
        case 서울, 경기, 인천, 충청_대전, 전라_광주, 경북_대구, 경남_부산_울산, 강원, 제주
        
        public func asString() -> String {
            switch self {
            case .서울:
               return "서울"
            case .경기:
               return "경기"
            case .인천:
               return "인천"
            case .충청_대전:
               return "충청/대전"
            case .전라_광주:
               return "전라/광주"
            case .경북_대구:
               return "경북/대구"
            case .경남_부산_울산:
               return "경남/부산/울산"
            case .강원:
               return "강원"
            case .제주:
               return "제주"
            }
        }
    }
    
    public enum UserType: Codable {
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
        public var areas: Set<Area>
        public var userType: UserType
        public init(id: Int,
                    jwt: String? = nil,
                    name: String? = nil,
                    imageUrl: String? = nil,
                    email: String? = nil,
                    phoneNumber: String? = nil,
                    gender: Gender? = nil,
                    areas: Set<Area> = Set(),
                    userType: UserType = .guest
        ) {
            self.id = id
            self.jwt = jwt
            self.name = name
            self.imageUrl = imageUrl
            self.email = email
            self.phoneNumber = phoneNumber
            self.gender = gender
            self.areas = areas
            self.userType = userType
        }
    }
    
}
