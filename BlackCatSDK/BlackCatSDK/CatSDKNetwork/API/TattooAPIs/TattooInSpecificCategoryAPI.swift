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
    var tattooType: String?
    var addressId: Int?
    var parameter: [String: Any] {
        var paremeter: [String: Any] = [:]
        if page != nil { paremeter["page"] = page }
        if size != nil { paremeter["size"] = size }
        // TODO: - 특정 카테고리 api는 sort가 없는가 ? 물어보기
//        if sort != nil { paremeter["sort"] = sort }
//        if direction != nil { paremeter["direction"] = direction }
        if tattooType != nil { paremeter["tattooType"] = tattooType }
        if addressId != nil { paremeter["addressId"] = addressId }
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
        tattooType: String? = nil,
        addressId: Int? = nil
    ) {
        self.categoryID = categoryID
        self.page = page
        self.size = size
        self.sort = sort
        self.direction = direction
        self.tattooType = tattooType
        self.addressId = addressId
    }
}
