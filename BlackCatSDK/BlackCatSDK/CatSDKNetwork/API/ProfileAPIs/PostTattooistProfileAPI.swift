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
    var path: String { "tattooists/profile" }
    
    var method: Moya.Method { .post }
    
    var task: Moya.Task { .requestJSONEncodable(request) }
    
    init(request: DTO.TattooistProfile.Introduce.Post.Request) {
        self.request = request
    }
    
}
