//
//  BookmarkPostIdsDTO.swift
//  BlackCatSDK
//
//  Created by SeYeong on 2023/02/19.
//

import Foundation

extension DTO.Bookmark {
    struct PostIds: Decodable {
        let postIds: [Int]
    }
}
