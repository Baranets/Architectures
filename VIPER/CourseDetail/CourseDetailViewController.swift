//
//  CourseDetailViewController.swift
//  VIPER
//
//  Created by Maxim Baranets on 20.02.2020.
//  Copyright (c) 2020 Maxim Baranets. All rights reserved.
//

import UIKit

protocol CourseDetailViewProtocol: class {
    
    func setImage(with image: UIImage?)
    func setName(with name: String?)
    func setLink(with link: String?)
    
}

class CourseDetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var linkLabel: UILabel!

    var presenter: CourseDetailPresenterProtocol!
    
    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.showDetail()
    }

}

extension CourseDetailViewController: CourseDetailViewProtocol {
    
    func setImage(with image: UIImage?) {
        imageView.image = image
    }
    
    func setName(with name: String?) {
        nameLabel.text = name
    }
    
    func setLink(with link: String?) {
        linkLabel.text = link
    }
    
}
