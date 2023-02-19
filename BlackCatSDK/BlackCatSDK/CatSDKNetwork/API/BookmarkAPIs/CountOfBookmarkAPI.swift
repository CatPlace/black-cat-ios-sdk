//
//  BookmarkCountAPI.swift
//  BlackCatSDK
//
//  Created by SeYeong on 2023/02/19.
//

import Foundation

import Moya

struct CountOfBookmarkAPI: ServiceAPI {
    typealias Response = DTO.Bookmark.CountOfBookmark

    let postId: Int
    let token: String
    init(
        postId: Int,
        token: String
    ) {
        self.postId = postId
        self.token = token
    }

    var path: String { "likes/posts/\(postId)/count" }
    var method: Moya.Method { .get }
    var task: Moya.Task {
        .requestParameters(parameters: [
            "AUTHORIZATION": token
        ], encoding: URLEncoding.default)
    }
}
