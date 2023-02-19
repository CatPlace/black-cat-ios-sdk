//
//  AddTattooAPI.swift
//  BlackCatSDK
//
//  Created by SeYeong on 2022/11/09.
//

import Foundation

import Moya

struct AddTattooAPI: ServiceAPI {
    typealias Response = DTO.Tattoo.Update.Response
    
    var tattooImageDatas: [Data]
    var tattooInfo: DTO.Tattoo.Update.Request
    var path: String = "tattoos"
    var method: Moya.Method { .post }
    var task: Moya.Task
    init(
        tattooImageDatas: [Data],
        tattooInfo: DTO.Tattoo.Update.Request
    ) {
        self.tattooImageDatas = tattooImageDatas
        self.tattooInfo = tattooInfo
        self.task = .uploadMultipart(converToMultiPartFormData(tattooInfo, tattooImageDatas))
        
        func converToMultiPartFormData(_ dto: DTO.Tattoo.Update.Request, _ images: [Data]) -> [MultipartFormData] {
            let tattooInfoData = try! JSONEncoder().encode(dto)
            print("타투 인포:", dto)
            var formDataList: [MultipartFormData] = [.init(provider: .data(tattooInfoData), name: "tattooInfo", mimeType: "application/json")]
            
            images.forEach { imageData in
                print("🐷🐷🐷", imageData)
                formDataList.append(.init(provider: .data(imageData), name: "images", fileName: "test.jpeg", mimeType: "image/jpeg"))
            }
            print("멀티파트:", formDataList)
            return formDataList
        }
    }
}
