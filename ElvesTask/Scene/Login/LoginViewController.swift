//
//  LoginViewController.swift
//  ElvesTask
//
//  Created by BinaryBoy on 11/13/18.
//  Copyright (c) 2018 BinaryBoy. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class LoginViewController: BaseViewController{
    fileprivate var viewModel: LoginViewModel = LoginViewModel()
    fileprivate var router: LoginRouter = LoginRouter()

    init(withViewModel viewModel: LoginViewModel, router: LoginRouter) {
        super.init(nibName: nil, bundle: nil)
        self.viewModel = viewModel
        self.router = router
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = LoginViewModel()
        router.viewController = self
        setupRx(viewModel: viewModel)
    }
    @IBAction func loginWithFacebook(_ sender: UIButton) {
        self.viewModel.login(vc: self)
    }
    
    override func setupRx(viewModel: BaseViewModel) {
        super.setupRx(viewModel: viewModel)
        
        self.viewModel.loginObservable.subscribe(onNext: { [weak self] canNavigate in
            if canNavigate {
            self?.router.navigateToTaskList()
            }
        }).disposed(by: self.disposeBag)
    }
}
