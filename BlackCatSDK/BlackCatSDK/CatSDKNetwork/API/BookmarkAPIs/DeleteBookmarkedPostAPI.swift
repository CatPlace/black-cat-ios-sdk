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
    var path: String { "likes/posts/1" }
    var method: Moya.Method { .delete }
    var task: Moya.Task {
        .requestParameters(parameters: [
            "AUTHORIZATION": token,
            "postId": postId
        ], encoding: URLEncoding.default)
    }
}
