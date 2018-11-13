//
//  LoginBuilder.swift
//  ElvesTask
//
//  Created by BinaryBoy on 11/13/18.
//  Copyright (c) 2018 BinaryBoy. All rights reserved.
//

import UIKit

struct LoginBuilder {

    static func viewController() -> UIViewController {
        let viewModel = LoginViewModel()
        let router = LoginRouter()
        let viewController = LoginViewController(withViewModel: viewModel, router: router)
        router.viewController = viewController

        return viewController
    }
}
