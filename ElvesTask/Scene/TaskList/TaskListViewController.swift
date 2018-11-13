//
//  TaskListViewController.swift
//  ElvesTask
//
//  Created by BinaryBoy on 11/13/18.
//  Copyright (c) 2018 BinaryBoy. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class TaskListViewController: UIViewController {
    fileprivate let viewModel: TaskListViewModel
    fileprivate let router: TaskListRouter
    fileprivate let disposeBag = DisposeBag()

    init(withViewModel viewModel: TaskListViewModel, router: TaskListRouter) {
        self.viewModel = viewModel
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setupLayout()
        setupRx()
    }
}

// MARK: Setup
private extension TaskListViewController {

    func setupViews() {
        
    }

    func setupLayout() {
    
    }

    func setupRx() {
    
    }
}
