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
    init(
        postIds: [Int]
    ) {
        self.postIds = postIds
    }
    var path: String { "likes/posts" }
    var method: Moya.Method { .delete }
    var task: Moya.Task {
        .requestParameters(parameters: [
            "postIds": postIds
        ], encoding: URLEncoding.httpBody)
    }
}
