//
//  LoginRouter.swift
//  ElvesTask
//
//  Created by BinaryBoy on 11/13/18.
//  Copyright (c) 2018 BinaryBoy. All rights reserved.
//

import Foundation

class LoginRouter {
    weak var viewController: LoginViewController?

    func navigateToTaskList() {
           let taskListViewController = TaskListBuilder.viewController()
        
        viewController?.navigationController?.pushViewController(taskListViewController, animated: true)
    }
}
