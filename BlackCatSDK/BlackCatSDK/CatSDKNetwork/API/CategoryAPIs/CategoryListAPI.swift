//
//  CategoryListAPI.swift
//  BlackCatSDK
//
//  Created by SeYeong on 2022/11/08.
//

import Foundation

import Moya

struct CategoryListAPI: ServiceAPI {
    typealias Response = [DTO.Category.List.Category]

    var path: String = "categories"
    var method: Moya.Method { .get }
    var task: Moya.Task { .requestPlain }
}
