//
//  CategoryListDTO.swift
//  BlackCatSDK
//
//  Created by SeYeong on 2022/11/08.
//

import Foundation

extension DTO.Category {
    struct List: Decodable {
        let category: [Category]

        struct Category: Decodable {
            let id: Int
            let name: String
            let count: Int
        }
    }
}
