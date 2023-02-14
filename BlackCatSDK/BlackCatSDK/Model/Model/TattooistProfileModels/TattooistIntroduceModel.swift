//
//  TattooistIntroduceModel.swift
//  BlackCatSDK
//
//  Created by 김지훈 on 2023/02/06.
//

import Foundation

extension Model {
    public struct TattooistIntroduce {
        public let introduce: String
        public let imageUrlString: String?
        
        public init(introduce: String, imageUrlString: String? = nil) {
            self.introduce = introduce
            self.imageUrlString = imageUrlString
        }
    }
}
