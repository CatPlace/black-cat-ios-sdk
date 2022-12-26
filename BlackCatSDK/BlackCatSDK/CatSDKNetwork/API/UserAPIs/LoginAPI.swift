//
//  LoginAPI.swift
//  BlackCatSDK
//
//  Created by 김지훈 on 2022/11/18.
//

import Foundation
import Moya

struct LoginAPI: ServiceAPI {
    typealias Response = DTO.User.Login.Response
    let request: DTO.User.Login.Request
    var path: String = "users/login"
    var method: Moya.Method { .post }
    var task: Moya.Task { .requestJSONEncodable(request) }
    
    init(request: DTO.User.Login.Request) {
        self.request = request
    }
}
