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
        if let sort, let direction {
            paremeter["sort"] = [sort, direction]
        }
        if tattooTypes != nil { paremeter["tattooTypes"] = tattooTypes }
        if addressIds != nil { paremeter["addressIds"] = addressIds }
        return paremeter
    }
    var path: String { "tattoos/categories/\(categoryID)" }
    var method: Moya.Method { .get }
    var task: Moya.Task {
        return .requestParameters(parameters: parameter, encoding: BlackCatQueryStringEncoding.default)
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
