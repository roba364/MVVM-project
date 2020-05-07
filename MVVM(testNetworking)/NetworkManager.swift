//
//  NetworkManager.swift
//  MVVM(testNetworking)
//
//  Created by SofiaBuslavskaya on 20/03/2020.
//  Copyright © 2020 Sergey Borovkov. All rights reserved.
//

import Foundation

class NetworkManager: NSObject {
    
    func fetchMovies(completion: ([String]) -> ()) {
        
        completion(["Movie1", "Movie2", "Movie3"])
    }
}
