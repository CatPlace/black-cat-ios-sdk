//
//  UpdateDTO.swift
//  BlackCatSDK
//
//  Created by 김지훈 on 2023/02/01.
//

import Foundation

extension DTO.Tattoo {
    struct Update {
        struct Request: Encodable {
            let tattooType: String
            let categoryId: Int
            let title: String
            let price: Int
            let description: String
            let deleteImageUrls: [String]? = nil
        }
        
        struct Response: Decodable {
            let tattooId: Int
            let imageUrls: [String]
        }
    }
}
