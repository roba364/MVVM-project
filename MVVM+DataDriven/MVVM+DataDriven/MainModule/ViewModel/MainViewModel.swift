//
//  MainViewModel.swift
//  MVVM+DataDriven
//
//  Created by SofiaBuslavskaya on 11/05/2020.
//  Copyright © 2020 Sergey Borovkov. All rights reserved.
//

import UIKit

// Dependency Inversion

protocol MainViewModelProtocol {
    var updateViewData: ((ViewData) -> Void)? { get set }
    func startFetch()
    func error()
}

final class MainViewModel: MainViewModelProtocol {
    
    public var updateViewData: ((ViewData) -> Void)?
    
    init() {
        updateViewData?(.initial)
    }
    
    func error() {
        updateViewData?(.failure(ViewData.UserData(
        icon: UIImage(named: "close"),
        title: "Error",
        description: "loading failure",
        numberPhone: nil)))
    }
    
    func startFetch() {
        updateViewData?(.success(ViewData.UserData(
        icon: UIImage(named: "interface"),
        title: "Success",
        description: "loading success",
        numberPhone: nil)))

    }
}
