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

    let postType: PostType
    let token: String
    init(
        postType: PostType,
        token: String
    ) {
        self.postType = postType
        self.token = token
    }
    var path: String { "likes/posts" }
    var method: Moya.Method { .get }
    var task: Moya.Task {
        .requestParameters(parameters: [
            "AUTHORIZATION": token,
            "postType": postType.rawValue
        ], encoding: URLEncoding.default)}
}

extension BookmarkListUserLikedAPI {
    enum PostType: String {
        case tattoo = "TATTOO"
        case magazine = "MAGAZINE"
    }
}
