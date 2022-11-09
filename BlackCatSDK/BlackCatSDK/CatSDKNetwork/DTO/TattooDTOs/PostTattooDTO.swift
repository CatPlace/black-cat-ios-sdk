//
//  PostTattooDTO.swift
//  BlackCatSDK
//
//  Created by SeYeong on 2022/11/09.
//

import Foundation

extension DTO.Tattoo {
    struct Post: Decodable {
        let tattooId: Int
        let imageUrls: [String]
    }
}
