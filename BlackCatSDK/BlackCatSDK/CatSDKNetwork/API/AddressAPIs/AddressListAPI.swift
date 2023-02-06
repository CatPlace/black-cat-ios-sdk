//
//  AddressListAPI.swift
//  BlackCatSDK
//
//  Created by SeYeong on 2022/11/09.
//

import Foundation

import Moya

struct AddressListAPI: ServiceAPI {
    typealias Response = DTO.Address.List

    var path: String = "addresses"
    var method: Moya.Method { .get }
    var task: Moya.Task { .requestPlain }
}
