//
//  TasksManager.swift
//  ElvesTask
//
//  Created by BinaryBoy on 11/14/18.
//  Copyright © 2018 BinaryBoy. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

import Alamofire

// MARK: - AppServerClient
final class TasksManagerClient {
    
    // MARK: - GetFriends
    enum FailureReason: Int, Error {
        case unAuthorized = 401
        case notFound = 404
        
        var localizedDescription: String? {
            switch self {
            case .unAuthorized:
                return "بإمكانك الدخول باسم المستخدم بدلاً من فيسبوك😎"
            case .notFound:
                return "عفواً يرجى إدخال جميع المعلومات"
            }
        }
    }
 
    
    static func getTasks() -> Observable<[TasksResult]> {
        return Observable.create { observer -> Disposable in
            Alamofire.request("https://private-anon-d76fb8268d-elves.apiary-mock.com/tasks")
                .validate()
                .responseJSON { response in
                    switch response.result {
                    case .success:
                        guard let data = response.data else {
                            // if no error provided by alamofire return .notFound error instead.
                            // .notFound should never happen here?
                            observer.onError(response.error ?? FailureReason.notFound)
                            return
                        }
                        do {
                            let tasksResult = try JSONDecoder().decode([TasksResult].self, from: data)
                            observer.onNext(tasksResult)
                        } catch {
                            observer.onError(error)
                        }
                    case .failure(let error):
                        if let statusCode = response.response?.statusCode,
                            let reason = FailureReason(rawValue: statusCode)
                        {
                            observer.onError(reason)
                        }
                        observer.onError(error)
                    }
            }
            
            return Disposables.create()
        }
    }
    
    static func compelteTask(taskId:Int) -> Observable<Bool> {
        return Observable.create { observer -> Disposable in
            
            Alamofire.request("https://private-anon-d76fb8268d-elves.apiary-mock.com/tasks/\(taskId)", method: .put)
                .validate()
                .responseJSON { response in
                    switch response.result {
                    case .success:
                        guard let data = response.data else {
                            // if no error provided by alamofire return .notFound error instead.
                            // .notFound should never happen here?
                            observer.onError(response.error ?? FailureReason.notFound)
                            return
                        }
                        do {
                            let json = try JSONSerialization.jsonObject(with: data) as? [String: Bool]
                            
                            if json?["completed"] == true{
                                observer.onNext(true)
                            }else{
                                observer.onNext(false)
                                
                            }
                            
                        } catch {
                            observer.onError(error)
                        }
                    case .failure(let error):
                        if let statusCode = response.response?.statusCode,
                            let reason = FailureReason(rawValue: statusCode)
                        {
                            observer.onError(reason)
                        }
                        observer.onError(error)
                    }
            }
            
            return Disposables.create()
        }
    }
}

