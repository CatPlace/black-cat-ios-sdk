//
//  TattooistIntroduceDTO.swift
//  BlackCatSDK
//
//  Created by 김지훈 on 2023/02/06.
//

import Foundation

extension DTO.TattooistProfile {
    struct Introduce {
        struct Post {
            struct Request: Encodable {
                let profileInfo: ProfileInfo
                let images: [Data]
                struct ProfileInfo: Encodable {
                    let introduce: String
                    let deleteImageUrls: [String]
                }
            }
        }
        
        struct Response: Decodable {
            let profileId: Int
            let introduce: String?
            let imageUrls: [String]
            let userName: String?
            let addressId: Int?
            let userImgUrls: [String]?
        }
    }
}
