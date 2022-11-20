//
//  UpdateAddressAPI.swift
//  BlackCatSDK
//
//  Created by 김지훈 on 2022/11/18.
//

import Foundation
import Moya

struct UpdateAddressAPI: ServiceAPI {
    typealias Response = DTO.User.updateAddress.Response
    let request: DTO.User.updateAddress.Request
    var path: String = "users/address"
    var method: Moya.Method { .post }
    var task: Moya.Task { .requestPlain }
    
    init(request: DTO.User.updateAddress.Request) {
        self.request = request
    }
}
