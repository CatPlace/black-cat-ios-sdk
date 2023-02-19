//
//  BookmarkPostAPI.swift
//  BlackCatSDK
//
//  Created by SeYeong on 2023/01/23.
//

import Foundation

import Moya

struct BookmarkPostAPI: ServiceAPI {
    typealias Response = DTO.Bookmark.StatusOfBookmark

    let postId: Int
    init(postId: Int) {
        self.postId = postId
    }
    var path: String { "likes/posts/\(postId)" }
    var method: Moya.Method { .post }
    var task: Moya.Task { .requestPlain }
}
