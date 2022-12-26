//
//  TattooInSpecificCategoryAPI.swift
//  BlackCatSDK
//
//  Created by SeYeong on 2022/11/09.
//

import Foundation

import Moya

struct TattooInSpecificCategoryAPI: ServiceAPI {
    typealias Response = DTO.Tattoo.List

    var categoryID: Int
    var page: Int
    var size: Int
    init(
        categoryID: Int,
        page: Int,
        size: Int
    ) {
        self.categoryID = categoryID
        self.page = page
        self.size = size
    }
    var path: String {"tattoos/categories/\(categoryID)" }
    var method: Moya.Method { .get }
    var task: Moya.Task { .requestParameters(parameters: [
        "page": page,
        "size": size
    ], encoding: URLEncoding.queryString) }
}
