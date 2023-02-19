//
//  StatusOfBookmarkPostAPI.swift
//  BlackCatSDK
//
//  Created by SeYeong on 2023/01/23.
//

import Foundation

import Moya

/// 게시물 좋아요 조회
struct StatusOfBookmarkAPI: ServiceAPI {
    typealias Response = DTO.Bookmark.StatusOfBookmark

    let postId: Int
    init(postId: Int) {
        self.postId = postId
    }
    var path: String { "likes/posts/\(postId)" }
    var method: Moya.Method { .get }
    var task: Moya.Task { .requestPlain }
}
