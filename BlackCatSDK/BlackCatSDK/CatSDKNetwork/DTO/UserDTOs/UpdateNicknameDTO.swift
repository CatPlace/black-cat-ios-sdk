//
//  UpdateNicknameDTO.swift
//  BlackCatSDK
//
//  Created by 김지훈 on 2022/11/18.
//

import Foundation

extension DTO.User {
    struct updateNickname {
        struct Request: Encodable {
            let nickName: String
        }
        
        struct Response: Decodable {
            let nickName: String
        }
    }
}
