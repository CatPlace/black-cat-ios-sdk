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
        public var imageName: String?
        
        public init(id: Int, name: String, count: Int, imageName: String? = nil) {
            self.id = id
            self.name = name
            self.count = count
            self.imageName = imageName
        }
    }
}
