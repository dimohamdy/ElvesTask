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
    fileprivate var viewModel: TaskListViewModel = TaskListViewModel()
    fileprivate var router: TaskListRouter = TaskListRouter()
    
    @IBOutlet weak var taskTableView: UITableView!
    init(withViewModel viewModel: TaskListViewModel, router: TaskListRouter) {
        self.viewModel = viewModel
        self.router = router
        super.init(nibName: nil, bundle: nil)
        PKHUD.sharedHUD.contentView = PKHUDSuccessView()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupRx(viewModel: viewModel)
        
    }
    override func setupRx(viewModel: BaseViewModel){
        super.setupRx(viewModel: viewModel)
        
        self.viewModel.tasksCells.bind(to: self.taskTableView.rx.items) { [weak self] tableView, index, element in
            let indexPath = IndexPath(item: index, section: 0)
            switch element {
                
            case .task(let cellViewModel):
                guard let cell = tableView.dequeueReusableCell(withIdentifier: TaskCell.id, for: indexPath) as? TaskCell else {
                    return UITableViewCell()
                }
                cell.task = cellViewModel
                cell.viewModel = self?.viewModel
                cell.selectionStyle = .none
                return cell
            case .header(let title):
                guard let cell = tableView.dequeueReusableCell(withIdentifier: HeaderCell.id, for: indexPath) as? HeaderCell else {
                    return UITableViewCell()
                }
                cell.selectionStyle = .none
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
            }.disposed(by: self.disposeBag)
    }
}
