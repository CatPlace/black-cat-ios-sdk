//
//  UpdateRoleDTO.swift
//  BlackCatSDK
//
//  Created by 김지훈 on 2022/11/18.
//

import Foundation

extension DTO.User {
    struct UpdateRole {
        struct Response: Decodable {
            let userId: Int
            let role: String
        }
    }
}
