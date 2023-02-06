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
    var path: String { "tattooists/profile" }
    
    var method: Moya.Method { .get }
    
    var task: Moya.Task { .requestPlain }
}
