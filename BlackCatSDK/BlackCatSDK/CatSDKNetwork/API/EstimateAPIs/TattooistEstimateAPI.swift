//
//  TattooistEstimateAPI.swift
//  BlackCatSDK
//
//  Created by 김지훈 on 2023/02/06.
//

import Foundation
import Moya

class TattooistEstimateAPI: ServiceAPI {
    typealias Response = DTO.TattooistProfile.Estimate
    var tattooistId: Int
    var path: String { "estimate/tattooists/\(tattooistId)" }
    
    var method: Moya.Method { .get }
    
    var task: Moya.Task { .requestPlain }
    var headers: [String : String]? { return nil }
    
    init(tattooistId: Int) {
        self.tattooistId = tattooistId
    }
}
