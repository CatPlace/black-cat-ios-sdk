//
//  UpdateNicknameAPI.swift
//  BlackCatSDK
//
//  Created by 김지훈 on 2022/11/18.
//

import Foundation
import Moya

struct UpdateNicknameAPI: ServiceAPI {
    typealias Response = DTO.User.updateNickname.Response
    let request: DTO.User.updateNickname.Request
    var path: String = "users/nickname"
    var method: Moya.Method { .post }
    var task: Moya.Task { .requestJSONEncodable(request) }
    
    init(request: DTO.User.updateNickname.Request) {
        self.request = request
    }
}
