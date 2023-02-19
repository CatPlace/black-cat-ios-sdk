//
//  DeleteTattooAPI.swift
//  BlackCatSDK
//
//  Created by 김지훈 on 2023/02/06.
//

import Foundation
import Moya

class DeleteTattooAPI: ServiceAPI {
    typealias Response = DTO.Tattoo.Delete.Response
    
    let request: DTO.Tattoo.Delete.Request
    var path: String {
        "tattoos"
    }
    var method: Moya.Method { .delete }
    var task: Moya.Task {
        .requestJSONEncodable(request)
    }
    
    init(request: DTO.Tattoo.Delete.Request) {
        self.request = request
    }
}

extension DTO.Tattoo {
    struct Delete {
        struct Request: Encodable {
            let tattooIds: [Int]
        }
        struct Response: Decodable {
            let deletedTattooIds: [Int]
        }
    }
}
