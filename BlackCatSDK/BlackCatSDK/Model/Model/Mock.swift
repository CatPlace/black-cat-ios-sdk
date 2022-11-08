//
//  Mock.swift
//  BlackCatSDK
//
//  Created by SeYeong on 2022/10/10.
//

import Foundation

import RealmSwift

extension Model {
    public struct Mock {
        public let postID: Int
        public let name: String
        public let email: String
        public let body: String

        public init(postID: Int, name: String, email: String, body: String) {
            self.postID = postID
            self.name = name
            self.email = email
            self.body = body
        }
    }
}
