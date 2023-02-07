//
//  CatSDKUser.swift
//  BlackCatSDK
//
//  Created by 김지훈 on 2022/12/01.
//

import UIKit
import RxSwift
import BlackCatKEY
import RxCocoa

public class CatSDKUser {
    /// 앱단에서도 사용할 수 있는 로그인 타입입니다. 소셜로그인 뿐만아니라 다른 타입도 정의가능합니다
    public enum LoginType: String {
        case kakao = "KAKAO"
        case apple = "APPLE"
        
        /// 버튼 기본 이미지의 이름을 가져옵니다.
        public func buttonImageName() -> String {
            switch self {
            case .kakao:
                return "kakaoLogin"
            case .apple:
                return "appleLogin"
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
    
    public static func imageUrlString() -> Observable<String?> {
        UserDefaultManager.imageUrlString()
    }
    
    public static func userType() -> Model.UserType {
        UserDefaultManager.getUser().userType
    }
    
    public static func logout() {
        UserDefaultManager.updateUser(user: .init(id: -2))
    }
    
    public static func updateUser(user: Model.User) {
        UserDefaultManager.updateUser(user: user)

    }
    
    public static func user() -> Model.User {
        UserDefaultManager.getUser()
    }
    
    public static func withdrawal() {
        // TODO: - 서버 통신
        
    }
    
    public static func updateUserProfile(user: Model.User)  -> Observable<Model.User> {
        // TODO: - 서버에 유저 전체 정보 내려달라 한 뒤 업데이트
        var tempUser = CatSDKUser.user()
        return CatSDKNetworkUser.rx.updateProfile(name: user.name ?? "", email: user.email ?? "", phoneNumber: user.phoneNumber ?? "", gender: user.gender?.serverValue() ?? "", addressId: user.area?.rawValue ?? -1)
            .do { newUser in
                tempUser.name = newUser.name
                tempUser.email = newUser.email
                tempUser.phoneNumber = newUser.phoneNumber
                tempUser.gender = newUser.gender
                tempUser.area = newUser.area
                tempUser.imageUrl = newUser.imageUrl
                CatSDKUser.updateUser(user: tempUser)
                print("업데이트 된 유저", tempUser)
            }.catch { _ in .just(.init(id: -99999))}
            .debug("유저 업데이트 서버 통신")
    }
}
