//
//  CatSDKUser.swift
//  BlackCatSDK
//
//  Created by 김지훈 on 2022/12/01.
//

import UIKit
import RxSwift
import BlackCatKEY

public class CatSDKUser {
    public enum LoginType {
        case kakao, apple
        
        public func buttonImageName() -> String {
            switch self {
            case .kakao:
                return "login_kakao"
            case .apple:
                return "login_apple"
            }
        }
    }
    
    public static func initSDK(with URLContexts: Set<UIOpenURLContext>? = nil) {
        BlackCatSocialLoginSDK.initSDK(with: URLContexts, kakaoAppKey: BlackCatKEY.KakaoSDK.key)
    }
    
    public static func login(type: LoginType) -> Observable<Result<Model.User, Error>>{
        var token: Observable<String>
        switch type {
        case .kakao:
            token = BlackCatSocialLoginSDK.accessToken(type: .kakao)
        case .apple:
            token = BlackCatSocialLoginSDK.accessToken(type: .apple)
        }
        
        // TODO: - API 연동
        return token
            .map { _ in .success(Model.User(jwt: "a", name: "b", imageUrl: "c")) }
    }
    
    public static func logout() {
        
    }
    
    public static func 탈퇴() {
        
    }
}

