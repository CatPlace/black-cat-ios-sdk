//
//  UserListInSpecificBookmarkAPI.swift
//  BlackCatSDK
//
//  Created by SeYeong on 2023/01/23.
//

import Foundation

import Moya

struct UserListInSpecificBookmarkAPI: ServiceAPI {
    typealias Response = DTO.Bookmark.UserListInSpecificBookmark

    let postId: Int
    let token: String
    init(
        postId: Int,
        token: String
    ) {
        self.postId = postId
        self.token = token
    }
    var path: String { "likes/posts/1/users" }
    var method: Moya.Method { .get }
    var task: Moya.Task {
        .requestParameters(parameters: [
            "AUTHORIZATION": token,
            "postId": postId
        ], encoding: URLEncoding.default)
    }
}