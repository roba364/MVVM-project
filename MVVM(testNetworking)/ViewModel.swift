//
//  ViewModel.swift
//  MVVM(testNetworking)
//
//  Created by SofiaBuslavskaya on 20/03/2020.
//  Copyright © 2020 Sergey Borovkov. All rights reserved.
//

import Foundation

class ViewModel: NSObject {
    
    weak var networkManager: NetworkManager!
    
    private var movies: [String]?
    
    func fetchMovies(completion: @escaping ()->()) {
        
        networkManager.fetchMovies { [weak self] (movies) in
            guard let self = self else { return }
            
            self.movies = movies
            completion()
        }
    }
    
    func numberOfRowsInSection() -> Int {
        return movies?.count ?? 0
    }
    
    func titleForCell(indexPath: IndexPath) -> String {
        
        guard let movies = movies else { return "" }
        
        return movies[indexPath.row]
    }
}
