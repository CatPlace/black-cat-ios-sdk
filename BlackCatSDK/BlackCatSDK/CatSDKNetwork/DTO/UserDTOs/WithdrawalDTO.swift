//
//  WithdrawalDTO.swift
//  BlackCatSDK
//
//  Created by 김지훈 on 2023/01/31.
//

import Foundation

extension DTO.User {
    public struct Withdrawal {
        struct Response: Decodable {
            let userId: Int
        }
    }
}
