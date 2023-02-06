//
//  AddressSearchDTO.swift
//  BlackCatSDK
//
//  Created by SeYeong on 2022/11/09.
//

import Foundation

extension DTO.Address {
    struct List: Decodable {
        let addresses: [Address]

        struct Address: Decodable {
            let id: Int
            let sido: String
        }
    }
}
