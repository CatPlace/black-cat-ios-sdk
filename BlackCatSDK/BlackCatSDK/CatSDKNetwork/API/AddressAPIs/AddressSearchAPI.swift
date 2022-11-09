//
//  AddressSearchAPI.swift
//  BlackCatSDK
//
//  Created by SeYeong on 2022/11/09.
//

import Foundation

import Moya

struct AddressSearchAPI: ServiceAPI {
    typealias Response = DTO.Address.Search

    var page: Int
    var size: Int
    init(page: Int, size: Int) {
        self.page = page
        self.size = size
    }
    var path: String = "addresses/search"
    var method: Moya.Method { .get }
    var task: Moya.Task { .requestPlain }
}
