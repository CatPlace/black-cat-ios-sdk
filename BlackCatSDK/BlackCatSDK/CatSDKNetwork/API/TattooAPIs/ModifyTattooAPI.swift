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
    var method: Moya.Method { .patch }
    var task: Moya.Task
    
    init(
        tattooId: Int,
        tattooImageDataList: [Data],
        tattooInfo: DTO.Tattoo.Update.Request
    ) {
        self.tattooId = tattooId
        self.tattooImageDataList = tattooImageDataList
        self.tattooInfo = tattooInfo
        
        self.task = .uploadMultipart(converToMultiPartFormData(tattooInfo, tattooImageDataList))
        
        func converToMultiPartFormData(_ dto: DTO.Tattoo.Update.Request, _ images: [Data]) -> [MultipartFormData] {
            let tattooInfoData = try! JSONEncoder().encode(dto)


            var formDataList: [MultipartFormData] = [.init(provider: .data(tattooInfoData), name: "tattooInfo", mimeType: "application/json")]
            images.forEach { imageData in

                formDataList.append(.init(provider: .data(imageData), name: "images", fileName: "test.jpeg", mimeType: "image/jpeg"))
            }

            return formDataList
        }
    }
}
