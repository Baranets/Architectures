//
//  CourseDetailWorker.swift
//  VIPER
//
//  Created by Maxim Baranets on 20.02.2020.
//  Copyright (c) 2020 Maxim Baranets. All rights reserved.
//

import UIKit

protocol CourseDetailConfiguratorProtocol: class {
    
    func configure(with viewController: CourseDetailViewController, course: Course)
    
}

class CourseDetailConfigurator: CourseDetailConfiguratorProtocol {
    
    func configure(with viewController: CourseDetailViewController, course: Course) {
        let presenter = CourseDetailPresenter(view: viewController)
        let interactor = CourseDetailInteractor(presenter: presenter, course: course)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
    }
    
}
