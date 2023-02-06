//
//  ModifyTattooAPI.swift
//  BlackCatSDK
//
//  Created by 김지훈 on 2023/02/06.
//

import Foundation
import Moya

struct ModifyTattooAPI: ServiceAPI {
    typealias Response = DTO.Tattoo.Update.Response
    
    var tattooId: Int
    var tattooImageDataList: [Data]
    var tattooInfo: DTO.Tattoo.Update.Request
    var path: String { "tattoos/\(tattooId)" }
    var method: Moya.Method { .post }
    var multiPartFormDatas: [MultipartFormData] {
        let tattooInfoData = try! JSONEncoder().encode(tattooInfo)
        var formDatas: [MultipartFormData] = [.init(provider: .data(tattooInfoData), name: "tattooInfo")]
        tattooImageDataList.forEach { imageData in
            formDatas.append(.init(provider: .data(imageData), name: "images"))
        }

        return formDatas
    }
    var task: Moya.Task { .uploadMultipart(multiPartFormDatas) }
    
    init(
        tattooId: Int,
        tattooImageDataList: [Data],
        tattooInfo: DTO.Tattoo.Update.Request
    ) {
        self.tattooId = tattooId
        self.tattooImageDataList = tattooImageDataList
        self.tattooInfo = tattooInfo
    }
}
