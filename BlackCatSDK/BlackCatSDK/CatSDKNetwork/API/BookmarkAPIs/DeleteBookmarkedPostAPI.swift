//
//  DeleteBookmarkedPostAPI.swift
//  BlackCatSDK
//
//  Created by SeYeong on 2023/01/23.
//

import Foundation

import Moya

struct DeleteBookmarkedPostAPI: ServiceAPI {
    typealias Response = DTO.Bookmark.StatusOfBookmark

    let postId: Int
    let token: String
    init(
        postId: Int,
        token: String
    ) {
        self.postId = postId
        self.token = token
    }
    var path: String { "likes/posts/\(postId)" }
    var method: Moya.Method { .delete }
    var task: Moya.Task { .requestPlain }
}
