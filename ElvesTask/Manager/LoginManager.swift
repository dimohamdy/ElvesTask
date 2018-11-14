//
//  LoginManager.swift
//  ElvesTask
//
//  Created by BinaryBoy on 11/13/18.
//  Copyright © 2018 BinaryBoy. All rights reserved.
//

import UIKit
import KeychainSwift
import FacebookCore
import FacebookLogin
import RxSwift

enum FaceBookLoginError: Error, LocalizedError {
    
    case  fail, canceled
    
    var localizedDescription: String? {
        switch self {
        case .canceled:
            return "بإمكانك الدخول باسم المستخدم بدلاً من فيسبوك😎"
        case .fail:
            return "حدث خطا اثناء تسجيل الدخول"
        }
    }
}

final class LogManager {

    static func loginWithFB(_ vc: UIViewController) -> Observable<AccessToken> {

        return Observable.create { observer -> Disposable in
            let loginManager = LoginManager()
            loginManager.logIn(readPermissions: [ ReadPermission.publicProfile,ReadPermission.email], viewController: vc, completion: { loginResult in
                switch loginResult {
                case .failed(let error):
                    print(error)
                    observer.onError(FaceBookLoginError.fail)
                case .cancelled:
                    print("User cancelled login.")
                    observer.onError(FaceBookLoginError.canceled)
                case .success(let grantedPermissions, let declinedPermissions, let accessToken):
                    print("Logged in!")
                    print(accessToken)
                    observer.onNext(accessToken)
                }
            })
            return Disposables.create()
        }
    }
}


