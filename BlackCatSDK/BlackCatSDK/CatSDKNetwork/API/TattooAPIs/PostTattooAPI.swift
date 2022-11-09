//
//  PostTattoo.swift
//  BlackCatSDK
//
//  Created by SeYeong on 2022/11/09.
//

import UIKit

import Moya

struct PostTattooAPI: ServiceAPI {
    typealias Response = DTO.Tattoo.Post

    var tattooImages: [UIImage]
    var tattooInfos: [TattooInfo]
    var path: String = "tattoos"
    var method: Moya.Method { .post }
    var multiPartFormDatas: [MultipartFormData] {
        // TODO: - 멀티파트 폼 해결
        []
    }
    var task: Moya.Task {
        .uploadMultipart(multiPartFormDatas)
    }
}

extension PostTattooAPI {
    struct TattooInfo: Encodable {
        let tattooType: String
        let categoryId: Int
        let title: String
        let price: Int
        let description: String
    }
}
