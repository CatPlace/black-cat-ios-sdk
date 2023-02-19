//
//  UserListInSpecificBookmarkAPI.swift
//  BlackCatSDK
//
//  Created by SeYeong on 2023/01/23.
//

import Foundation

import Moya

/// 게시물을 좋아요 한 유저들 조회
struct UserListInSpecificBookmarkAPI: ServiceAPI {
    typealias Response = DTO.Bookmark.UserListInSpecificBookmark

    let postId: Int
    init(
        postId: Int
    ) {
        self.postId = postId
    }
    var path: String { "likes/posts/\(postId)/users" }
    var method: Moya.Method { .get }
    var task: Moya.Task {
        .requestPlain
    }
}
