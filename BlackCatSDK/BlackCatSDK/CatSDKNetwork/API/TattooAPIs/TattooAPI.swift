//
//  TattooAPI.swift
//  BlackCatSDK
//
//  Created by 김지훈 on 2023/02/06.
//

import Foundation
import Moya

class TattooAPI: ServiceAPI {
    typealias Response = DTO.Tattoo.List.Tattoo
    
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
