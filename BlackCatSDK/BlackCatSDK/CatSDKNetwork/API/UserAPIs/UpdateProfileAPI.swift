//
//  UpdateProfileAPI.swift
//  BlackCatSDK
//
//  Created by 김지훈 on 2023/01/31.
//

import Foundation
import Moya

struct UpdateProfileAPI: ServiceAPI {
    typealias Response = DTO.User.UpdateProfile.Response
    
    let request: DTO.User.UpdateProfile.Request
    var path: String = "users/additional-info"
    var method: Moya.Method { .patch }
    var task: Moya.Task

    init(request: DTO.User.UpdateProfile.Request) {
        self.request = request
        print(request)
        task = .uploadMultipart(converToMultiPartFormData(request))
        
        func converToMultiPartFormData(_ dto: DTO.User.UpdateProfile.Request) -> [MultipartFormData] {
            let userInfoData = try! JSONEncoder().encode(dto.userInfo)
            print("유저 인포:", dto.userInfo)
            var formDataList: [MultipartFormData] = [.init(provider: .data(userInfoData), name: "userInfo", mimeType: "application/json")]
            
            if let imageDataList = dto.imageDataList {
                imageDataList.forEach { imageData in
                    print("🐷🐷🐷", imageData)
                    formDataList.append(.init(provider: .data(imageData), name: "images", fileName: "test.jpeg", mimeType: "image/jpeg"))
                }
            }
            print("멀티파트:", formDataList)
            return formDataList
        }
    }
}
