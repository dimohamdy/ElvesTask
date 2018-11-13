//
//  TaskListBuilder.swift
//  ElvesTask
//
//  Created by BinaryBoy on 11/13/18.
//  Copyright (c) 2018 BinaryBoy. All rights reserved.
//

import UIKit

struct TaskListBuilder {

    static func viewController() -> UIViewController {
        let viewModel = TaskListViewModel()
        let router = TaskListRouter()
        let viewController = TaskListViewController(withViewModel: viewModel, router: router)
        router.viewController = viewController

        return viewController
    }
}
