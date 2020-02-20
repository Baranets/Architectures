//
//  CourseDetailPresenter.swift
//  VIPER
//
//  Created by Maxim Baranets on 20.02.2020.
//  Copyright (c) 2020 Maxim Baranets. All rights reserved.

import UIKit
import Kingfisher

protocol CourseDetailPresenterProtocol: class {
    
    func showDetail()
    
}

class CourseDetailPresenter {
    
    weak var viewController: CourseDetailViewProtocol!
    var interactor: CourseDetailInteractorProtocol!
    
    required init(view: CourseDetailViewProtocol) {
        self.viewController = view
    }
    
}

extension CourseDetailPresenter: CourseDetailPresenterProtocol {
    
    func showDetail() {
        interactor.provideCourseDetail()
    }
    
}

extension CourseDetailPresenter: CourseDetailInteractorOutputProtocol {
    
    func receivedCourseDetail(course: Course) {
        viewController.setName(with: course.name)
        viewController.setLink(with: course.link)
        
        guard let url = course.url else { return }
        
        let options: KingfisherOptionsInfo = [
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(0.5)),
                .cacheOriginalImage
        ]
        
        KingfisherManager.shared.retrieveImage(with: url, options: options) { [weak self] (result) in
            switch result {
            case .success(let value):
                self?.viewController.setImage(with: value.image)
            case .failure(let error):
                print(error)
                print(error.localizedDescription)
            }
        }

    }
    
}
