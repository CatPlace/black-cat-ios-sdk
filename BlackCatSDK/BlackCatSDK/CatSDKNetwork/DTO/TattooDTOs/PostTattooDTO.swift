//
//  PostTattooDTO.swift
//  BlackCatSDK
//
//  Created by SeYeong on 2022/11/09.
//

import Foundation

extension DTO.Tattoo {
    struct Post {
        struct Response: Decodable {
            let tattooId: Int
            let imageUrls: [String]
        }

        struct Request: Encodable {
            let tattooType: String
            let categoryId: Int
            let title: String
            let price: Int
            let description: String
        }
    }
}
