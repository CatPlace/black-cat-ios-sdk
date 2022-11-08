//
//  MagazineListDTO.swift
//  BlackCatSDK
//
//  Created by SeYeong on 2022/11/08.
//

import Foundation

extension DTO {
    struct MagazineList: Decodable {
        let status: String
        let data: DataClass
        let error: String?
        let code: Int

        struct DataClass: Decodable {
            let magazines: [Magazine]
            let pageable: Pageable
            let last: Bool
            let totalPages, totalElements, size, number: Int
            let sort: Sort
            let first: Bool
            let numberOfElements: Int
            let empty: Bool

            struct Magazine: Decodable {
                let id: Int
                let title: String
                let imageURL: String?
                let isMain: Bool
            }

            struct Pageable: Decodable {
                let sort: Sort
                let offset, pageNumber, pageSize: Int
                let paged, unpaged: Bool
            }

            struct Sort: Decodable {
                let empty, sorted, unsorted: Bool
            }
        }
    }
}
