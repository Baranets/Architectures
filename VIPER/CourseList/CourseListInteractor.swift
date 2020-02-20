//
//  CourseListInteractor.swift
//  VIPER
//
//  Created by Maxim Baranets on 04.02.2020.
//  Copyright © 2020 Maxim Baranets. All rights reserved.
//

import Foundation

protocol CourseListInteractorProtocol: class {
    
    func featchCourses()
    
}

protocol CourseListInteractorOutputProtocol: class {

    func coursesDidReceive(_ courses: [Course])

}

class CourseListInteractor {
    weak var presenter: CourseListInteractorOutputProtocol!
    
    required init(presenter: CourseListInteractorOutputProtocol) {
        self.presenter = presenter
    }
}

extension CourseListInteractor: CourseListInteractorProtocol {
    
    func featchCourses() {
        NetworkManager.shared.featchCourses { [weak self] (courses) in
            self?.presenter.coursesDidReceive(courses)
        }
    }
    
}
