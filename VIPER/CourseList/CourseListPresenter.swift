//
//  CourseListPresenter.swift
//  VIPER
//
//  Created by Maxim Baranets on 04.02.2020.
//  Copyright © 2020 Maxim Baranets. All rights reserved.
//

import Foundation

protocol CourseListPresenterProtocol: class {
    
    var courses: [Course] { get set }
    var coursesCount: Int { get }
    func viewDidLoad()
    func course(for indexPath: IndexPath) -> Course
    func showDetails(for indexPath: IndexPath)
    
}

class CourseListPresenter {
    
    weak var view: CourseListViewProtocol!
    var interactor: CourseListInteractorProtocol!
    var router: CourseListRouterProtocol!
    
    var courses = [Course]()
    var coursesCount: Int {
        return courses.count
    }
    
    required init(view: CourseListViewProtocol) {
        self.view = view
    }
    
}

extension CourseListPresenter: CourseListPresenterProtocol {
    
    func viewDidLoad() {
        interactor.featchCourses()
    }
    
    func course(for indexPath: IndexPath) -> Course {
        return courses[indexPath.row]
    }
    
    func showDetails(for indexPath: IndexPath) {
        let course = self.course(for: indexPath)
        router.openCourseDetailViewController(with: course)
    }
    
}

extension CourseListPresenter: CourseListInteractorOutputProtocol {
    
    func coursesDidReceive(_ courses: [Course]) {
        self.courses = courses
        view.reloadTable()
    }
    
}
