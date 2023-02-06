//
//  TattooThumbnailListDTO.swift
//  BlackCatSDK
//
//  Created by 김지훈 on 2023/02/06.
//

import Foundation

extension DTO.Tattoo {
    struct ThumbnailList {
        struct Response: Decodable {
            let tattoos: [Tattoo]
            let pageable: Pageable
            let totalPages: Int
            let totalElements: Int
            let last: Bool
            let number: Int
            let sort: Sort
            let size: Int
            let numberOfElements: Int
            let first: Bool
            let empty: Bool
            
            struct Tattoo: Decodable {
                let id: Int
                let imageUrl: String
            }
            
            struct Pageable: Decodable {
                let sort: Sort
                let offset: Int
                let pageNumber: Int
                let pageSize: Int
                let paged: Bool
                let unpaged: Bool
            }
            
            struct Sort: Decodable {
                let empty: Bool
                let sorted: Bool
                let unsorted: Bool
            }
            
            enum CodingKeys: String, CodingKey {
                case tattoos = "content"
                case pageable, last, totalPages, totalElements
                case size, number, sort, first, numberOfElements, empty
            }
        }
    }
}
