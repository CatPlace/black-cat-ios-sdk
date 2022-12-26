//
//  TattooListDTO.swift
//  BlackCatSDK
//
//  Created by SeYeong on 2022/11/09.
//

import Foundation

extension DTO.Tattoo {
    struct List: Decodable {
        let tattoos: [Tattoo]
        let pageable: Pageable
        let last: Bool
        let totalPages: Int
        let totalElements: Int
        let size: Int
        let number: Int
        let sort: Sort
        let first: Bool
        let numberOfElements: Int
        let empty: Bool

        struct Tattoo: Decodable {
            let id: Int
            let price: Int
            let description: String
            let liked: Bool
            let imageUrls: [String]
            let address: String
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
