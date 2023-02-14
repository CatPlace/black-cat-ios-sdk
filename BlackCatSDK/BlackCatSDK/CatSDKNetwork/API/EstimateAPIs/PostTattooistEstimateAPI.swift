//
//  PostTattooistEstimateAPI.swift
//  BlackCatSDK
//
//  Created by 김지훈 on 2023/02/06.
//

import Foundation
import Moya

class PostTattooistEstimateAPI: ServiceAPI {
    typealias Response = DTO.TattooistProfile.Estimate
    let request: DTO.TattooistProfile.Estimate
    
    var path: String { "estimate/tattooists" }
    
    var method: Moya.Method { .post }
    
    var task: Moya.Task { .requestJSONEncodable(request) }
    
    init(request: DTO.TattooistProfile.Estimate) {
        self.request = request
    }
}
