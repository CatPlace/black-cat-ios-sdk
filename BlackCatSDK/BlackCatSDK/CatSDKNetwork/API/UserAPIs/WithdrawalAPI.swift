//
//  WithdrawalAPI.swift
//  BlackCatSDK
//
//  Created by 김지훈 on 2023/01/31.
//

import Foundation
import Moya
import BlackCatKEY

struct WithdrawalAPI: ServiceAPI {
    typealias Response = DTO.User.Withdrawal.Response
    
    var path: String = "users"
    var method: Moya.Method { .delete }
    var task: Moya.Task { .requestPlain }
}
