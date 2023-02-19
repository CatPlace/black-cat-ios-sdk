//
//  CountBookmarkDTO.swift
//  BlackCatSDK
//
//  Created by SeYeong on 2023/02/19.
//

import Foundation

extension DTO.Bookmark {
    struct CountOfBookmark: Decodable {
        let likesCount: Int
    }
}
