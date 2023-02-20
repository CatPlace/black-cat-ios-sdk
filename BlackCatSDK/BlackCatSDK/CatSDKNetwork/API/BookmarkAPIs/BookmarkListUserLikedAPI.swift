//
//  BookmarkListUserLikedAPI.swift
//  BlackCatSDK
//
//  Created by SeYeong on 2023/01/23.
//

import Foundation

import Moya

/// 유저가 좋아요한 게시물들 조회 API
struct BookmarkListUserLikedAPI: ServiceAPI {
    typealias Response = DTO.Bookmark.BookmarkListUserLiked

    let postType: String
    init(
        postType: String
    ) {
        self.postType = postType
    }
    var path: String { "likes/posts" }
    var method: Moya.Method { .get }
    var task: Moya.Task {
        .requestParameters(parameters: [
            "postType": postType
        ], encoding: URLEncoding.default)
    }
}
