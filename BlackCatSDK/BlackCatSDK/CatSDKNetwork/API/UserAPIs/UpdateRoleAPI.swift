//
//  UpdateRoleAPI.swift
//  BlackCatSDK
//
//  Created by 김지훈 on 2022/11/18.
//

import Foundation
import Moya

struct UpdateRoleAPI: ServiceAPI {
    typealias Response = DTO.User.UpdateRole.Response
    var path: String = "users/tattooist-role"
    var method: Moya.Method { .patch }
    var task: Moya.Task { .requestPlain }
}
