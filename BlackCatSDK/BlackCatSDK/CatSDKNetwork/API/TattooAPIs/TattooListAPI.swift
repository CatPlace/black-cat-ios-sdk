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
    
    var page: Int?
    var size: Int?
    var sort: String?
    var direction: String?
    var tattooTypes: [String]?
    var addressIds: [Int]?
    var parameter: [String: Any] {
        var paremeter: [String: Any] = [:]
        if page != nil { paremeter["page"] = page }
        if size != nil { paremeter["size"] = size }
        if sort != nil { paremeter["sort"] = sort }
        if direction != nil { paremeter["direction"] = direction }
        if tattooTypes != nil { paremeter["tattooTypes"] = tattooTypes }
        if addressIds != nil { paremeter["addressIds"] = addressIds }
        return paremeter
    }
    var path: String = "tattoos"
    var method: Moya.Method { .get }
    var task: Moya.Task {
        .requestParameters(parameters: parameter, encoding: URLEncoding.queryString)
    }
    
    init(
        page: Int? = nil,
        size: Int? = nil,
        sort: String? = "likesCount",
        direction: String? = "DESC",
        tattooTypes: [String]? = nil,
        addressIds: [Int]? = nil
    ) {
        self.page = page
        self.size = size
        self.sort = sort
        self.direction = direction
        self.tattooTypes = tattooTypes
        self.addressIds = addressIds
    }
}
