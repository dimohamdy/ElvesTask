//
//  LoginViewModel.swift
//  ElvesTask
//
//  Created by BinaryBoy on 11/13/18.
//  Copyright (c) 2018 BinaryBoy. All rights reserved.
//

import RxSwift
import KeychainSwift
import FacebookCore
import FacebookLogin

enum ChainKeys : String{
    case fbToken
}
class LoginViewModel : BaseViewModel {


    // input
    var loginObservable: Observable<Bool> {
        return login.asObservable()
            .distinctUntilChanged()
    }
    
    private let login = Variable<Bool>(false)
    
    override init() {
        super.init()
        setupRx()
    }
    
    func login(vc:UIViewController){
        LogManager.loginWithFB(vc).subscribe(onNext: { [weak self] accessToken in
            let key = KeychainSwift()
            key.set(accessToken.authenticationToken, forKey: ChainKeys.fbToken.rawValue)
            self?.login.value = true
        }, onError: { [weak self]  error in
            let okAlert = SingleButtonAlert(
                title: (error as? FaceBookLoginError)?.localizedDescription ?? "Could not connect to server. Check your network and try again later.",
                message: "Failed to update information.",
                action: AlertAction(buttonTitle: "OK", handler: { print("Ok pressed!") })
            )

            self?.onShowError.onNext(okAlert)
        }).disposed(by: self.disposeBag)
    }
}

// MARK: Setup
private extension LoginViewModel {

    func setupRx() {

    }
}
