//
//  MultipleBookmarkPostAPI.swift
//  BlackCatSDK
//
//  Created by SeYeong on 2023/02/19.
//

import Foundation

import Moya

struct MultipleBookmarkPostAPI: ServiceAPI {
    typealias Response = DTO.Bookmark.PostIds

    let postIds: [Int]
    let token: String
    init(
        postIds: [Int],
        token: String
    ) {
        self.postIds = postIds
        self.token = token
    }
    var path: String { "likes/posts" }
    var method: Moya.Method { .post }
    var task: Moya.Task {
        .requestParameters(parameters: [
            "postIds": postIds
        ], encoding: URLEncoding.httpBody)
    }
}
