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
    init(postId: Int) {
        self.postId = postId
    }
    
    var path: String { "likes/posts/\(postId)/count" }
    var method: Moya.Method { .get }
    var task: Moya.Task { .requestPlain }
    var headers: [String : String]? { return nil }
}
