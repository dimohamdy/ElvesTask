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
import PKHUD

class TaskListViewController: BaseViewController {
    fileprivate let viewModel: TaskListViewModel
    fileprivate let router: TaskListRouter
    fileprivate let disposeBag = DisposeBag()
    
    @IBOutlet weak var taskTableView: UITableView!
    init(withViewModel viewModel: TaskListViewModel, router: TaskListRouter) {
        self.viewModel = viewModel
        self.router = router
        super.init(nibName: nil, bundle: nil)
        PKHUD.sharedHUD.contentView = PKHUDSuccessView()
        
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
        
        
        viewModel
            .onShowError
            .map { [weak self] in self?.presentSingleButtonDialog(alert: $0)}
            .subscribe()
            .disposed(by: disposeBag)
        
        viewModel
            .onShowLoadingHud
            .map { [weak self] in self?.setLoadingHud(visible: $0) }
            .subscribe()
            .disposed(by: disposeBag)
        
        
        viewModel
            .onShowError
            .map { [weak self] in self?.presentSingleButtonDialog(alert: $0)}
            .subscribe()
            .disposed(by: disposeBag)
        
        viewModel
            .onShowLoadingHud
            .map { [weak self] in self?.setLoadingHud(visible: $0) }
            .subscribe()
            .disposed(by: disposeBag)
        
        viewModel
            .onShowError
            .map { [weak self] in self?.presentSingleButtonDialog(alert: $0)}
            .subscribe()
            .disposed(by: disposeBag)
        
        viewModel
            .onShowLoadingHud
            .map {
                [weak self] in self?.setLoadingHud(visible: $0)
            }
            .subscribe()
            .disposed(by: disposeBag)
        
    }
    
    func bindViewModel() {
        viewModel.tasksCells.bind(to: self.taskTableView.rx.items) { tableView, index, element in
            let indexPath = IndexPath(item: index, section: 0)
            switch element {
                
            case .task(let cellViewModel):
                guard let cell = tableView.dequeueReusableCell(withIdentifier: TaskCell.id, for: indexPath) as? TaskCell else {
                    return UITableViewCell()
                }
                cell.task = cellViewModel
                return cell
            case .header(let title):
                guard let cell = tableView.dequeueReusableCell(withIdentifier: HeaderCell.id, for: indexPath) as? HeaderCell else {
                    return UITableViewCell()
                }
                cell.title = title
                return cell
            case .error(let message):
                let cell = UITableViewCell()
                cell.isUserInteractionEnabled = false
                cell.textLabel?.text = message
                return cell
            case .empty:
                let cell = UITableViewCell()
                cell.isUserInteractionEnabled = false
                cell.textLabel?.text = "No data available"
                return cell
            }
            }.disposed(by: disposeBag)
        
    }
    
}
