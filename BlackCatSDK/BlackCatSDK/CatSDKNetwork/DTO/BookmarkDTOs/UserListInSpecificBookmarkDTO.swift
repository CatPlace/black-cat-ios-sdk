//
//  UserListInSpecificBookmarkDTO.swift
//  BlackCatSDK
//
//  Created by SeYeong on 2023/01/23.
//

import Foundation

extension DTO.Bookmark {
    struct UserListInSpecificBookmark: Decodable {
        let content: [Content]
        let pageable: Pageable
        let totalPages, totalElements: Int
        let last: Bool
        let number: Int
        let sort: Sort
        let size, numberOfElements: Int
        let first, empty: Bool

        struct Content: Decodable {
            let likesId, userId: Int
            let nickname, createdDate: String
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
