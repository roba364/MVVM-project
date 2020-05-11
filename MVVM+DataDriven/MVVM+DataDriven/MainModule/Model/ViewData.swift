//
//  ViewData.swift
//  MVVM+DataDriven
//
//  Created by SofiaBuslavskaya on 11/05/2020.
//  Copyright © 2020 Sergey Borovkov. All rights reserved.
//

import Foundation

// описываем состояние View
enum ViewData {
    case initial
    case loading(UserData)
    case success(UserData)
    case failure(UserData)
    
    struct UserData {
        let icon: String?
        let title: String?
        let description: String?
        let numberPhone: String?
    }
}
