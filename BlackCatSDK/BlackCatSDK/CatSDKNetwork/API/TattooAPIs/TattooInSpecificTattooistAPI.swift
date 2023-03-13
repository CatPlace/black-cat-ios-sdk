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
    let tattooistId: Int
    var path: String { "tattoos/users/\(tattooistId)" }
    var method: Moya.Method { .get }
    var task: Moya.Task { .requestPlain }
    var headers: [String : String]? { return nil }
    
    init(tattooistId: Int) {
        self.tattooistId = tattooistId
    }
}
