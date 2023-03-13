//
//  TattooistProfileAPI.swift
//  BlackCatSDK
//
//  Created by 김지훈 on 2023/02/06.
//

import Foundation
import Moya

class TattooistProfileAPI: ServiceAPI {
    typealias Response = DTO.TattooistProfile.Introduce.Response
    var tattooistId: Int
    var path: String { "profile/tattooists/\(tattooistId)" }
    
    var method: Moya.Method { .get }
    
    var task: Moya.Task { .requestPlain }
    var headers: [String : String]? { return nil }
    
    init(tattooistId: Int) {
        self.tattooistId = tattooistId
    }
}
