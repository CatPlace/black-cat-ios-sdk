//
//  MagazineListAPI.swift
//  BlackCatSDK
//
//  Created by SeYeong on 2022/11/08.
//

import Foundation

import Moya

struct MagazineListAPI: ServiceAPI {
    typealias Response = DTO.MagazineList

    var path: String = "magazines"
    var method: Moya.Method { .get }
    var task: Moya.Task { .requestPlain}
}
