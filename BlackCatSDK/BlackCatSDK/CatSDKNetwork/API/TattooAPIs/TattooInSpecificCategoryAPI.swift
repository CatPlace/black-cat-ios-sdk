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
        // TODO: - 특정 카테고리 api는 sort가 없는가 ? 물어보기
//        if sort != nil { paremeter["sort"] = sort }
//        if direction != nil { paremeter["direction"] = direction }
        if tattooTypes != nil { paremeter["tattooTypes"] = tattooTypes }
        if addressIds != nil { paremeter["addressIds"] = addressIds }
        return paremeter
    }
    var path: String { "tattoos/categories/\(categoryID)" }
    var method: Moya.Method { .get }
    var task: Moya.Task {
        .requestParameters(parameters: parameter, encoding: URLEncoding.queryString)
    }
    
    init(
        categoryID: Int,
        page: Int? = nil,
        size: Int? = nil,
        sort: String? = "likesCount",
        direction: String? = "DESC",
        tattooTypes: [String]? = nil,
        addressIds: [Int]? = nil
    ) {
        self.categoryID = categoryID
        self.page = page
        self.size = size
        self.sort = sort
        self.direction = direction
        self.tattooTypes = tattooTypes
        self.addressIds = addressIds
    }
}
