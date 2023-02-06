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
    var tattooType: String?
    var addressId: Int?
    var parameter: [String: Any] {
        var paremeter: [String: Any] = [:]
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
        tattooType: String? = nil,
        addressId: Int? = nil
    ) {
        self.categoryID = categoryID
        self.tattooType = tattooType
        self.addressId = addressId
    }
}
