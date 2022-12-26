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

    var page: Int
    var size: Int
    init(page: Int, size: Int) {
        self.page = page
        self.size = size
    }
    var path: String = "tattoos"
    var method: Moya.Method { .get }
    var task: Moya.Task {
        .requestParameters(parameters: [
            "page": page,
            "size": size
        ], encoding: URLEncoding.queryString)
    }
}
