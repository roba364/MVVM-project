//
//  ViewController.swift
//  MVVM(testNetworking)
//
//  Created by SofiaBuslavskaya on 20/03/2020.
//  Copyright © 2020 Sergey Borovkov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var viewModel: ViewModel!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var ourLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        viewModel.fetchMovies { [weak self] in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return viewModel.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        ourLabel.text = viewModel.titleForCell(indexPath: indexPath)
        
        return cell
    }
    
    
    
}
