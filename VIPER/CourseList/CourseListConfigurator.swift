//
//  CourseListConfigurator.swift
//  VIPER
//
//  Created by Maxim Baranets on 04.02.2020.
//  Copyright © 2020 Maxim Baranets. All rights reserved.
//

import Foundation

protocol CourseListConfiguratorProtocol: class {
    
    func configure(with viewController: CourseListTableViewController)
    
}

class CourseListConfigurator: CourseListConfiguratorProtocol {
    
    func configure(with viewController: CourseListTableViewController) {
        let presenter  = CourseListPresenter(view: viewController)
        let interactor = CourseListInteractor(presenter: presenter)
        let router     = CourseListRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor     = interactor
        presenter.router         = router
    }
    
}
