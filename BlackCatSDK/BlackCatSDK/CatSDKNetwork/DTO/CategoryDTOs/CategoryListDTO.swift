//
//  CategoryListDTO.swift
//  BlackCatSDK
//
//  Created by SeYeong on 2022/11/08.
//

import Foundation

extension DTO {
    struct Category: Decodable {
        let list: [CategoryDetail]

        struct CategoryDetail: Decodable {
            let id: Int
            let name: String
            let count: Int
        }
    }
}
