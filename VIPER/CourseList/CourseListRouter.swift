//
//  CourseListRouter.swift
//  VIPER
//
//  Created by Maxim Baranets on 04.02.2020.
//  Copyright © 2020 Maxim Baranets. All rights reserved.
//

import Foundation

protocol CourseListRouterProtocol: class {
    func openCourseDetailViewController(with course: Course)
}

class CourseListRouter {
    
    weak var viewController: CourseListTableViewController!
    
    required init(viewController: CourseListTableViewController) {
        self.viewController = viewController
    }
    
}

extension CourseListRouter: CourseListRouterProtocol {
    
    func openCourseDetailViewController(with course: Course) {
        viewController.performSegue(
            withIdentifier: viewController.showDetailViewControllerSegueIdentifier,
            sender: course
        )
    }
    
}
