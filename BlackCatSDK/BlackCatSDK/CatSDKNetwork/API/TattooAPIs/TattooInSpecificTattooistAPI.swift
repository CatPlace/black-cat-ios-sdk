//
//  TattooInSpecificTattooistAPI.swift
//  BlackCatSDK
//
//  Created by 김지훈 on 2023/02/06.
//

import Foundation
import Moya

class TattooInSpecificTattooistAPI: ServiceAPI {
    typealias Response = DTO.Tattoo.ThumbnailList.Response
    
    var path: String { "tattoos/users" }
    var method: Moya.Method { .get }
    var task: Moya.Task { .requestPlain }
}
