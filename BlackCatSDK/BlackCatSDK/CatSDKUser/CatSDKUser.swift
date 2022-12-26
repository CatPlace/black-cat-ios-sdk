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
    /// 앱단에서도 사용할 수 있는 로그인 타입입니다. 소셜로그인 뿐만아니라 다른 타입도 정의가능합니다
    public enum LoginType: String {
        case kakao = "KAKAO"
        case apple = "APPLE"
        
        /// 버튼 기본 이미지의 이름을 가져옵니다.
        public func buttonImageName() -> String {
            switch self {
            case .kakao:
                return "login_kakao"
            case .apple:
                return "login_apple"
            }
        }
        
        /// 앱단에서 사용할 수 있는 타입을 써드파티SDK의 소셜로그인 타입으로 변경합니다.
        func blackCatSocialLoginType() -> BlackCatSocialLoginSDK.SocialLoginType {
            switch self {
            case .kakao:
                return .kakao
            case .apple:
                return .apple
            }
        }
    }
    
    public static func linkURLs(with URLContexts: Set<UIOpenURLContext>) {
        BlackCatSocialLoginSDK.linkURLs(with: URLContexts)
    }
    
    public static func registerAppKeys() {
        BlackCatSocialLoginSDK.registerAppKeys(kakaoAppKey: BlackCatKEY.kakaoAppKey)
    }
    
    public static func login(type: LoginType) -> Observable<Model.User>{
        let providerType = type.rawValue
        let providerToken = BlackCatSocialLoginSDK.accessToken(type: type.blackCatSocialLoginType())
        return providerToken
            .catch { _ in .just("") }
            .filter { $0 != "" }
            .flatMap { CatSDKNetworkUser.rx.login(providerType: providerType, providerToken: $0) }
    }
    
    public static func logout() {
        // TODO: 로컬 스토리지 유저 jwt 삭제 후 로그인 화면으로 이동
    }
    
    public static func withdrawal() {
        // TODO: 서버 개발자에게 탈퇴API 구현 요청
    }
}

