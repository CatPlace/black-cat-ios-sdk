//
//  UpdateRoleDTO.swift
//  BlackCatSDK
//
//  Created by 김지훈 on 2022/11/18.
//

import Foundation

extension DTO.User {
    struct updateRole {
        struct Request: Encodable {
            let role: String
        }
        
        struct Response: Decodable {
            let role: String
        }
    }
}
