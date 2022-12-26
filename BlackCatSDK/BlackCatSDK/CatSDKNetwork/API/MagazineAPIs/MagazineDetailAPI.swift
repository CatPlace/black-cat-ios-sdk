//
//  MagazineDetail.swift
//  BlackCatSDK
//
//  Created by SeYeong on 2022/11/08.
//

import Foundation

import Moya

struct MagazineDetailAPI: ServiceAPI {
    typealias Response = DTO.Magazine.Detail

    let id: Int
    init(id: Int) {
        self.id = id
    }
    var path: String { "magazines/\(id)"}
    var method: Moya.Method { .get }
    var task: Moya.Task { .requestPlain }
}
