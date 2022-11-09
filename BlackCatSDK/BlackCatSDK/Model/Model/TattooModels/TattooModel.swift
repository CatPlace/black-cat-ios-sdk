//
//  Tattoo.swift
//  BlackCatSDK
//
//  Created by SeYeong on 2022/11/09.
//

import Foundation

extension Model {
    public struct Tattoo {
        let id: Int
        let price: Int
        let tattooistName: String
        let description: String
        let liked: Bool
        let imageURLStrings: [String?]
        let address: String
    }
}
