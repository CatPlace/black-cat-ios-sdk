//
//  AddressSearchDTO.swift
//  BlackCatSDK
//
//  Created by SeYeong on 2022/11/09.
//

import Foundation

extension DTO.Address {
    struct Search: Decodable {
        let addresses: [Address]
        let pageable: Pageable
        let last: Bool
        let totalPages: Int
        let totalElements: Int
        let numberOfElements: Int
        let number: Int
        let first: Bool
        let sort: Sort
        let size: Int
        let empty: Bool

        struct Address: Decodable {
            let id: Int
            let zipCode: String
            let address: String
        }

        struct Pageable: Decodable {
            let sort: Sort
            let pageNumber: Int
            let pageSize: Int
            let offset: Int
            let paged: Bool
            let unpaged: Bool
        }

        struct Sort: Decodable {
            let sorted: Bool
            let unsorted: Bool
            let empty: Bool
        }

        enum CodingKeys: String, CodingKey {
            case addresses = "content"
            case pageable, last, totalPages, totalElements, numberOfElements
            case number, first, sort, size, empty
        }
    }
}
