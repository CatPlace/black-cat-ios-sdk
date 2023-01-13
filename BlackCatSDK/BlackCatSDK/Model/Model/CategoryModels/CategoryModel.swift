//
//  CategoryModel.swift
//  BlackCatSDK
//
//  Created by SeYeong on 2022/11/08.
//

import Foundation

extension Model {
    public struct Category {
        public let id: Int
        public let name: String
        public let count: Int

        public init(id: Int, name: String, count: Int) {
            self.id = id
            self.name = name
            self.count = count
        }
    }
}
