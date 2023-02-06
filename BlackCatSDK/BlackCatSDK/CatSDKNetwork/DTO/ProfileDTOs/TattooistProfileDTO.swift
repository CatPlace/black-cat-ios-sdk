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
                }
            }
        }
        struct Response: Decodable {
            let introduce: String
            let imageUrls: [String]
        }
    }
}
