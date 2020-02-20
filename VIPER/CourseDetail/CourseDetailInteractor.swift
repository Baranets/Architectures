//
//  CourseDetailInteractor.swift
//  VIPER
//
//  Created by Maxim Baranets on 20.02.2020.
//  Copyright (c) 2020 Maxim Baranets. All rights reserved.

import UIKit

protocol CourseDetailInteractorProtocol: class {
    
    func provideCourseDetail()
    
}

protocol CourseDetailInteractorOutputProtocol: class {
    
    func receivedCourseDetail(course: Course)
    
}

class CourseDetailInteractor {
    
    weak var presenter: CourseDetailInteractorOutputProtocol!
    var course: Course!
    
    required init(presenter: CourseDetailInteractorOutputProtocol, course: Course) {
        self.presenter = presenter
        self.course = course
    }
    
}

extension CourseDetailInteractor: CourseDetailInteractorProtocol {
    
    func provideCourseDetail() {
        presenter.receivedCourseDetail(course: course)
    }
    
}
