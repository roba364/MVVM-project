//
//  TestView.swift
//  MVVM+DataDriven
//
//  Created by SofiaBuslavskaya on 11/05/2020.
//  Copyright © 2020 Sergey Borovkov. All rights reserved.
//

import UIKit

class TestView: UIView {
    
    // делаем обработчик ViewDatы, той модельки, которая будет прилетать
    var viewData: ViewData = .initial {
        didSet {
            // когда срабатывает какое-либо изменение - перерисовываем layout
            setNeedsLayout()
            // когда сработал setNeedsLayout(), он попросит UIKit перерисоваться
        }
    }

    lazy var imageView = makeImageView()
    lazy var activityIndicator = makeActivityIndicatorView()
    lazy var titleLabel = makeTitleLabel()
    lazy var descriptionLabel = makeDescriptionLabel()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // Когда UIKit будет перерисовывать - здесь будем перерисовывать наше состояние, чтобы не потерять никакую производительность
        // Наша вьюха должна реагировать на все состояния
        // Конкретно про модель и про данные View вообще ничего не знает, она ждет когда будут приходить данные и отрисовывает их
        
        switch viewData {
        case .initial:
            update(viewData: nil, isHidden: true, activityIndicator: &activityIndicator)
        case .loading(let loading):
            update(viewData: loading, isHidden: false, activityIndicator: &activityIndicator)
        case .success(let success): update(viewData: success, isHidden: false, activityIndicator: &activityIndicator)
        case .failure(let failure): update(viewData: failure, isHidden: false, activityIndicator: &activityIndicator)
        }
    }
    
    private func update(viewData: ViewData.UserData?, isHidden: Bool, activityIndicator: inout UIActivityIndicatorView) {
        imageView.image = viewData?.icon
        titleLabel.text = viewData?.title
        descriptionLabel.text = viewData?.description
        titleLabel.isHidden = isHidden
        descriptionLabel.isHidden = isHidden
        if isHidden {
            activityIndicator.isHidden = true
            activityIndicator.stopAnimating()
        } else {
            activityIndicator.isHidden = false
            activityIndicator.startAnimating()
        }
    }
}
