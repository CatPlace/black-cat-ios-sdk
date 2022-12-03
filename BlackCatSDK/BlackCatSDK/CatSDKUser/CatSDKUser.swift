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
    public enum LoginType: String {
        case kakao = "KAKAO"
        case apple = "APPLE"
        
        public func buttonImageName() -> String {
            switch self {
            case .kakao:
                return "login_kakao"
            case .apple:
                return "login_apple"
            }
        }
        
        func blackCatSocialLoginType() -> BlackCatSocialLoginSDK.SocialLoginType {
            switch self {
            case .kakao:
                return .kakao
            case .apple:
                return .apple
            }
        }
    }
    
    public static func initSDK(with URLContexts: Set<UIOpenURLContext>? = nil) {
        BlackCatSocialLoginSDK.initSDK(with: URLContexts, kakaoAppKey: BlackCatKEY.kakaoAppKey)
    }
    
    public static func login(type: LoginType) -> Observable<Model.User>{
        let providerType = type.rawValue
        let providerToken = BlackCatSocialLoginSDK.accessToken(type: type.blackCatSocialLoginType())
        return providerToken
            .flatMap { CatSDKNetworkUser.rx.login(providerType: providerType, providerToken: $0) }
    }
    
    public static func logout() {
        
    }
    
    public static func 탈퇴() {
        
    }
}

