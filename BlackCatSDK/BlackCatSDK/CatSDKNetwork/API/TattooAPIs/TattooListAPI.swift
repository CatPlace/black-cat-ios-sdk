//
//  TattooListAPI.swift
//  BlackCatSDK
//
//  Created by SeYeong on 2022/11/09.
//

import Foundation

import Moya

struct TattooListAPI: ServiceAPI {
    typealias Response = DTO.Tattoo.List

    var tattooType: String?
    var addressId: Int?
    var parameter: [String: Any] {
        var paremeter: [String: Any] = [:]
        if tattooType != nil { paremeter["tattooType"] = tattooType }
        if addressId != nil { paremeter["addressId"] = addressId }
        return paremeter
    }
    var path: String = "tattoos"
    var method: Moya.Method { .get }
    var task: Moya.Task {
        .requestParameters(parameters: parameter, encoding: URLEncoding.queryString)
    }
    
    init(tattooType: String? = nil, addressId: Int? = nil) {
        self.tattooType = tattooType
        self.addressId = addressId
    }
}
