//
//  swift
//  BlackCatSDK
//
//  Created by 김지훈 on 2022/12/01.
//

import UIKit
import AuthenticationServices

import RxSwift

import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser

import RxKakaoSDKCommon
import RxKakaoSDKAuth
import RxKakaoSDKUser

class BlackCatSocialLoginSDK: NSObject {
    /// 소셜로그인 타입입니다. ( case: kakao, apple )
    public enum SocialLoginType {
        case kakao, apple
    }
    
    // MARK: - Properties
    private var appleIdentityTokenSubject = PublishSubject<String>()
    /// 타입 함수 안에서 인스턴스 프로퍼티를 사용하기 위한 싱글톤 객체입니다.
    private static let shared = BlackCatSocialLoginSDK()
   
    // MARK: - Functions(interface)
    /// AppKey들을 등록합니다. 현재 카카오앱키 하나뿐
    static func registerAppKeys(kakaoAppKey: String?) {
        if let kakaoAppKey {
            KakaoSDK.initSDK(appKey: kakaoAppKey)
        }
    }
    
    /// url을 연결합니다. ( ex. kakaoTalk 앱으로 이동 )
    static func linkURLs(with URLContexts: Set<UIOpenURLContext>) {
        URLContexts.forEach { context in
            let url = context.url
            if AuthApi.isKakaoTalkLoginUrl(url) {
                _ = AuthController.handleOpenUrl(url: url)
            }
        }
    }
    
    /// 소셜로그인 타입별 AccessToken을 가져옵니다.
    static func accessToken(type: SocialLoginType) -> Observable<String> {
        switch type {
        case .kakao:
            return shared.kakaoAccessToken()
        case .apple:
            return shared.appleIdentityToken()
        }
    }
    
    // MARK: - Functions
    /// 카카오 Access Token을 가져옵니다.
    func kakaoAccessToken() -> Observable<String> {
        let oAuthToken = UserApi.isKakaoTalkLoginAvailable()
        ? UserApi.shared.rx.loginWithKakaoTalk()
        : UserApi.shared.rx.loginWithKakaoAccount()
        
        // TODO: - 에러처리
        return oAuthToken
            .debug("카카오 로그인 SDK")
            .map { $0.accessToken }
            .catch { _ in .just("") }
    }
    
    /// 애플 Identity Token을 가져옵니다.
    func appleIdentityToken() -> Observable<String> {
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        let request = appleIDProvider.createRequest()
        
        let authorizationController = ASAuthorizationController(authorizationRequests: [request])
        authorizationController.delegate = self
        authorizationController.presentationContextProvider = self
        authorizationController.performRequests()
        
        return appleIdentityTokenSubject.asObservable()
    }
    
}
extension BlackCatSocialLoginSDK: ASAuthorizationControllerDelegate,   ASAuthorizationControllerPresentationContextProviding {
    
    /// 애플 로그인을 진행할 화면을 지정합니다.
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return UIApplication.shared.keyWindow!
    }
    
    /// 애플서버에서 정보를 가져옵니다.
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        switch authorization.credential {
        case let appleIDCredential as ASAuthorizationAppleIDCredential:
            guard let identityToken = appleIDCredential.identityToken else { return }
            let identityTokenString = String(data: identityToken, encoding: .ascii)!
            appleIdentityTokenSubject.onNext(identityTokenString)
            appleIdentityTokenSubject = PublishSubject<String>()
        default:
            break
        }
    }
    
    /// 에러를 처리합니다. ( ex. 사용자가 애플로그인 취소 )
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        appleIdentityTokenSubject.onError(error)
        appleIdentityTokenSubject = PublishSubject<String>()
    }
}
