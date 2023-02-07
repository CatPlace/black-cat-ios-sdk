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
    var headers: [String : String]? { [
        "Authorization": "Bearer \(CatSDKUser.user().jwt ?? "")"
    ] }
    init(request: DTO.User.UpdateProfile.Request) {
        self.request = request
        print(request)
        task = .uploadMultipart(converToMultiPartFormData(request))
        func converToMultiPartFormData(_ dto: DTO.User.UpdateProfile.Request) -> [MultipartFormData] {
            
            let userInfoData = try! JSONEncoder().encode(dto.userInfo)
                
            var formDataList: [MultipartFormData] = [.init(provider: .data(userInfoData), name: "userInfo", mimeType: "application/json")]
            
            if let imageDataList = dto.imageDataList {
                imageDataList.forEach { imageData in
                    formDataList.append(.init(provider: .data(imageData), name: "images"))
                }
            }
            
            return formDataList
        }
    }
}

extension Encodable {
    
    var toDictionary : [String: Any]? {
        guard let object = try? JSONEncoder().encode(self) else { return nil }
        guard let dictionary = try? JSONSerialization.jsonObject(with: object, options: []) as? [String:Any] else { return nil }
        return dictionary
    }
}
