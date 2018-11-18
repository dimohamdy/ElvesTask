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
    private var result:[TasksResult] = [TasksResult]()
    
    
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
                    self?.result = result
                    self?.loadInProgress.value = false
                    self?.refresh(result: result, completeTaskId: nil)
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

    
    func compeleteTask(id:Int) {
        self.loadInProgress.value = true
        
        TasksManagerClient
            .compelteTask(taskId: id)
            .subscribe(
                onNext: { [weak self] result in
                    self?.loadInProgress.value = false
                    guard let result =  self?.result else {
                        return
                    }
                    self?.refresh(result: result, completeTaskId: id)
            },
        onError: { [weak self] error in
            self?.loadInProgress.value = false
            
            let okAlert = SingleButtonAlert(
                title: (error as? FaceBookLoginError)?.localizedDescription ?? "Could not connect to server. Check your network and try again later.",
                message: "Failed to update information.",
                action: AlertAction(buttonTitle: "OK", handler: { print("Ok pressed!") })
            )
            
            self?.onShowError.onNext(okAlert)
        }).disposed(by: disposeBag)
    }
    
    private func refresh(result:[TasksResult],completeTaskId:Int?){
        guard result.count > 0 else {
            self.cells.value = [.empty]
            return
        }
        
        
        var array:[TaskTableViewCellType] = [TaskTableViewCellType]()
    
        
        for (index1,dayTasks) in result.enumerated() {
            array.append(.header(title: dayTasks.date ?? ""))
            
            
            guard let tasks = dayTasks.tasks else{
                return
            }
            for  (index2,task) in tasks.enumerated() {
                if let id = completeTaskId,id == task.id{
                    self.result[index1].tasks?[index2].completed =  true
                }
                
                array.append(.task(cellViewModel: task))
            }
        }
        self.cells.value = array
        
    }
}
