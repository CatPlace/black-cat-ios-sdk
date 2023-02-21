//
//  PostTattooistProfileAPI.swift
//  BlackCatSDK
//
//  Created by 김지훈 on 2023/02/06.
//

import Foundation
import Moya

class PostTattooistProfileAPI: ServiceAPI {
    typealias Response = DTO.TattooistProfile.Introduce.Response
    let request: DTO.TattooistProfile.Introduce.Post.Request
    var path: String { "profile" }
    
    var method: Moya.Method { .post }
    
    var task: Moya.Task
    
    init(request: DTO.TattooistProfile.Introduce.Post.Request) {
        self.request = request
        
        task = .uploadMultipart(converToMultiPartFormData(request))
        
        func converToMultiPartFormData(_ dto: DTO.TattooistProfile.Introduce.Post.Request) -> [MultipartFormData] {
            let userInfoData = try! JSONEncoder().encode(dto.profileInfo)
            var formDataList: [MultipartFormData] = [.init(provider: .data(userInfoData), name: "profileInfo", mimeType: "application/json")]
            
            dto.images.forEach { imageData in
                formDataList.append(.init(provider: .data(imageData), name: "images", fileName: "test.jpeg", mimeType: "image/jpeg"))
            }
            return formDataList
        }
    }
    
}
