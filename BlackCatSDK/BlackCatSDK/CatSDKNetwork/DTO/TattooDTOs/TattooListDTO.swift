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
            let title: String
            let price: Int
            let tattooistId: Int
            let tattooistName: String?
            let description: String
            let address: String
            let imageUrls: [String]
            let tattooType: String
            let categoryIds: [Int]
            let likeCount: Int?
            let createDate: String?
            let profileImageUrls: [String]?
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
