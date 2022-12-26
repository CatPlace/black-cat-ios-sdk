//
//  UpdateRoleAPI.swift
//  BlackCatSDK
//
//  Created by 김지훈 on 2022/11/18.
//

import Foundation
import Moya

struct UpdateRoleAPI: ServiceAPI {
    typealias Response = DTO.User.updateRole.Response
    let request: DTO.User.updateRole.Request
    var path: String = "users/role"
    var method: Moya.Method { .post }
    var task: Moya.Task { .requestPlain }
    
    init(request: DTO.User.updateRole.Request) {
        self.request = request
    }
}
