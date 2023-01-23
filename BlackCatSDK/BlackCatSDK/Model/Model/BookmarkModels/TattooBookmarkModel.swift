//
//  TattooBookmarkModel.swift
//  BlackCatSDK
//
//  Created by SeYeong on 2023/01/23.
//

import Foundation

extension Model {
    public struct TattooBookmarkModel {
        public let likesId: Int
        public let postId: Int
        public let postType: String
        public let title: String
        public let imageUrl: String
        public let createdDate: String
    }
}
