//
//  BaseViewModel.swift
//  ElvesTask
//
//  Created by BinaryBoy on 11/17/18.
//  Copyright (c) 2018 BinaryBoy. All rights reserved.
//

import RxSwift

class BaseViewModel {

    var onShowLoadingHud: Observable<Bool> {
        return loadInProgress
            .asObservable()
            .distinctUntilChanged()
    }
    
    let onShowError = PublishSubject<SingleButtonAlert>()
    
    internal let loadInProgress = Variable(false)

    let disposeBag = DisposeBag()

    init() {
    }
}
