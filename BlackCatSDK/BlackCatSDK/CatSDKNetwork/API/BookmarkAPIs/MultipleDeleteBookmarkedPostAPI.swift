//
//  MultipleDeleteBookmarkedPostAPI.swift
//  BlackCatSDK
//
//  Created by SeYeong on 2023/02/19.
//

import Foundation

import Moya

struct MultipleDeleteBookmarkedPostAPI: ServiceAPI {
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
    var path: String { "likes/posts/1" }
    var method: Moya.Method { .delete }
    var task: Moya.Task {
        .requestParameters(parameters: [
            "AUTHORIZATION": token,
            "postIds": postIds
        ], encoding: URLEncoding.default)
    }
}
