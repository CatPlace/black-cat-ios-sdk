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
    init(categoryID: Int) {
        self.categoryID = categoryID
    }
    var path: String {"tattoos/categories/\(categoryID)" }
    var method: Moya.Method { .get }
    var task: Moya.Task { .requestPlain }
}
