//
//  UpdateAddressDTO.swift
//  BlackCatSDK
//
//  Created by 김지훈 on 2022/11/18.
//

import Foundation

extension DTO.User {
    struct updateAddress {
        struct Request: Encodable {
            let addressId: Int
        }
        
        struct Response: Decodable {
            let addressId: Int
        }
    }
}
