//
//  MainViewModel.swift
//  MVVM+DataDriven
//
//  Created by SofiaBuslavskaya on 11/05/2020.
//  Copyright © 2020 Sergey Borovkov. All rights reserved.
//

import Foundation

// Dependency Inversion

protocol MainViewModelProtocol {
    var updateViewData: ((ViewData) -> Void)? { get set }
    func startFetch()
}

final class MainViewModel: MainViewModelProtocol {
    
    public var updateViewData: ((ViewData) -> Void)?
    
    init() {
        updateViewData?(.initial)
    }
    
    func startFetch() {
        // start loading
        updateViewData?(.loading(ViewData.UserData(icon: nil,
                                                   title: nil,
                                                   description: nil,
                                                   numberPhone: nil)))
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            self?.updateViewData?(.success(ViewData.UserData(
                icon: "success",
                title: "Success",
                description: "loading success",
                numberPhone: nil)))
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) { [weak self] in
            self?.updateViewData?(.failure(ViewData.UserData(
                icon: "error",
                title: "Error",
                description: "loading failure",
                numberPhone: nil)))
        }
    }
}
