//
//  MockDTO.swift
//  BlackCatSDK
//
//  Created by SeYeong on 2022/10/10.
//

import Foundation

extension DTO {
    struct Mock: Decodable {
        public let postId: Int
        public let id: Int
        public let name: String
        public let email: String
        public let body: String
    }
}
