//
//  DeleteBookmarkedPostDTO.swift
//  BlackCatSDK
//
//  Created by SeYeong on 2023/01/23.
//

import Foundation

extension DTO.Bookmark {
    struct DeleteBookmarkedPostDTO: Decodable {
        let liked: Bool
    }
}
