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
    var profileId: Int
    var path: String { "profile/\(profileId)" }
    
    var method: Moya.Method { .get }
    
    var task: Moya.Task { .requestPlain }
    
    init(profileId: Int) {
        self.profileId = profileId
    }
}
