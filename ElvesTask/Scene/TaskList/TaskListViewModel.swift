//
//  TaskListViewModel.swift
//  ElvesTask
//
//  Created by BinaryBoy on 11/13/18.
//  Copyright (c) 2018 BinaryBoy. All rights reserved.
//

import RxSwift
enum TaskTableViewCellType {
    case task(cellViewModel: Task)
    case header(title: String)
    case error(message: String)
    case empty
}

class TaskListViewModel : BaseViewModel{

    
    // input
    var tasksCells: Observable<[TaskTableViewCellType]> {
        return cells.asObservable()
    }

    private let cells = Variable<[TaskTableViewCellType]>([])


    override init() {
        super.init()
        getFriends()
    }
    
    func getFriends() {
        self.loadInProgress.value = true
        
        TasksManagerClient
            .getTasks()
            .subscribe(
                onNext: { [weak self] result in
                    self?.loadInProgress.value = false
                    guard result.count > 0 else {
                        self?.cells.value = [.empty]
                        return
                    }
                    var array:[TaskTableViewCellType] = [TaskTableViewCellType]()
                    for dayTask in result {
                        array.append(.header(title: dayTask.date ?? ""))
                        for task in dayTask.tasks! {
                            array.append(.task(cellViewModel: task))
                        }
                    }
                    self?.cells.value = array
                },
                onError: { [weak self] error in
                    self?.loadInProgress.value = false
                    self?.cells.value = [
                        .error(
                            message: (error as? TasksManagerClient.FailureReason)?.localizedDescription ?? "Loading failed, check network connection"
                        )
                    ]
                }
            )
            .disposed(by: disposeBag)
    }
}
