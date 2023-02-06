//
//  TattooAPI.swift
//  BlackCatSDK
//
//  Created by 김지훈 on 2023/02/06.
//

import Foundation
import Moya

class TattooAPI: ServiceAPI {
    typealias Response = DTO.Tattoo.Detail.Response
    
    var tattooId: Int
    var path: String {
        "tattoos/\(tattooId)"
    }
    var method: Moya.Method { .get }
    var task: Moya.Task {
        .requestPlain
    }
    
    init(tattooId: Int) {
        self.tattooId = tattooId
    }
}

extension DTO.Tattoo {
    struct Detail {
        struct Response: Decodable {
            let id: Int
            let price: Int
            let tattooistId: Int
            let tattooistName: String?
            let description: String
            let address: String
            let imageUrls: [String]
            let tattooType: String
            let categoryId: Int
            let likeCount: Int
            let liked: Bool
        }
    }
}
