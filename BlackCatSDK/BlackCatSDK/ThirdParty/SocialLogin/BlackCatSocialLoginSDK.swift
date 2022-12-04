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
    public enum SocialLoginType {
        case kakao, apple
    }
    
    // MARK: - Properties
    private var appleIdentityTokenSubject = PublishSubject<String>()
    private static let shared = BlackCatSocialLoginSDK()
   
    // MARK: - Functions(interface)
    static func registerAppKeys(kakaoAppKey: String?) {
        if let kakaoAppKey {
            KakaoSDK.initSDK(appKey: kakaoAppKey)
        }
    }
    
    static func linkURLs(with URLContexts: Set<UIOpenURLContext>) {
        URLContexts.forEach { context in
            let url = context.url
            if AuthApi.isKakaoTalkLoginUrl(url) {
                _ = AuthController.handleOpenUrl(url: url)
            }
        }
    }
    
    static func accessToken(type: SocialLoginType) -> Observable<String> {
        switch type {
        case .kakao:
            return shared.kakaoAccessToken()
        case .apple:
            return shared.appleIdentityToken()
        }
    }
    
    // MARK: - Functions
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
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return UIApplication.shared.keyWindow!
    }
    
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
    
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        appleIdentityTokenSubject.onError(error)
        appleIdentityTokenSubject = PublishSubject<String>()
    }
}
