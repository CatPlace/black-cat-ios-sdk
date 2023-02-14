//
//  TattooistInfoModel.swift
//  BlackCatSDK
//
//  Created by 김지훈 on 2023/02/15.
//

import Foundation

extension Model {
    public struct TattooistInfo: Codable, Equatable {
        public var introduce: Model.TattooistIntroduce
        public var tattoos: [Model.TattooThumbnail]
        public var estimate: Model.TattooistEstimate
        
        public static let empty = TattooistInfo.init()
        
        public init(
            introduce: Model.TattooistIntroduce = .init(introduce: ""),
            tattoos: [Model.TattooThumbnail] = [],
            estimate: Model.TattooistEstimate = .init(description: "")
        ) {
            self.introduce = introduce
            self.tattoos = tattoos
            self.estimate = estimate
        }
    }
}
