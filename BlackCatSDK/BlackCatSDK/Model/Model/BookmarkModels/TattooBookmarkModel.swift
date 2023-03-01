//
//  TattooBookmarkModel.swift
//  BlackCatSDK
//
//  Created by SeYeong on 2023/01/23.
//

import Foundation

extension Model {
    public struct Bookmark {
        public let likesId: Int
        public let postId: Int
        public let userId: Int
        public let postType: PostType
        public let title: String
        public let imageUrl: String?
        public let createdDate: String
        
        public init(
            likesId: Int = 0,
            postId: Int,
            userId: Int,
            postType: PostType,
            title: String = "",
            imageUrl: String?,
            createdDate: String = ""
        ) {
            self.likesId = likesId
            self.postId = postId
            self.userId = userId
            self.postType = postType
            self.title = title
            self.imageUrl = imageUrl
            self.createdDate = createdDate
        }
    }
}
