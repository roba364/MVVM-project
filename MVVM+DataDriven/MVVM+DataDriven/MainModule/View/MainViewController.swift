//
//  ViewController.swift
//  MVVM+DataDriven
//
//  Created by SofiaBuslavskaya on 11/05/2020.
//  Copyright © 2020 Sergey Borovkov. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    // Dependency inversion
    private var viewModel: MainViewModelProtocol!
    

    private var testView: TestView!

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = MainViewModel()
        
        createView()
        updateView()
    }
    
    private func createView() {
        testView = TestView()
        testView.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
        testView.center = view.center
        view.addSubview(testView)
    }
    
    private func updateView() {
        // чтобы понимать что юзер тапнул, что выбрал, что из интернета пришло - подписываемся на closure, будем слушать этот closure
        viewModel.updateViewData = { [weak self] (viewData) in
            // то что будет прилетать от ViewModel'и - ViewController'a не должно касаться
            // мы берем viewData - и говорим чтобы она обновлялась
            self?.testView.viewData = viewData
            
            // мы реализуем такую логику где никто, ничего не знает
            // ViewModel берет на себя логику, она решает как View будет отрисовываться
            // И какие данные ViewModel прислала View, так она и будет отрисована
            // Внутрь TestView мы не хардкодим, чтобы можно было переиспользовать
            // ViewController занимается отрисовкой View, больше мы ничего ему не даем 
        }
    }
    @IBAction func startAction(_ sender: UIButton) {
        // мы говорим viewModel'и что у нас произошло событие
        viewModel.startFetch()
    }
    @IBAction func error(_ sender: UIButton) {
        viewModel.error()
    }
}

