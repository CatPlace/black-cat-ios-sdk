//
//  PostMagazineDTO.swift
//  BlackCatSDK
//
//  Created by SeYeong on 2022/11/08.
//

import Foundation

extension DTO.Magazine {
    struct Post: Decodable {
        let status: String
        let magazine: Magazine
        let error: String?
        let code: Int

        struct Magazine: Decodable {
            let id: Int
            let title: String
            let imageUrl: String?
            let isMain: Bool
        }
    }
}
