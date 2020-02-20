//
//  CourseTableViewCell.swift
//  VIPER
//
//  Created by Maxim Baranets on 20.02.2020.
//  Copyright © 2020 Maxim Baranets. All rights reserved.
//

import UIKit
import Kingfisher

class CourseTableViewCell: UITableViewCell {
    
    class var cellIdentifier: String {
        return String(describing: Self.self)
    }
    
    let courseImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    weak var course: Course? {
        didSet {
            self.layoutSubviews()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(courseImageView)
        addSubview(titleLabel)
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        configure(with: self.course)
    }
    
    private func configure(with course: Course?) {
        guard let course = course else { return }
        
        titleLabel.text = course.name
        
        guard let url = course.url else { return }
        let processor = DownsamplingImageProcessor(size: courseImageView.bounds.size)
        courseImageView.kf.setImage(
            with: url,
            placeholder: UIImage(),
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(0.5)),
                .cacheOriginalImage
        ])
    }
    
    private func setConstraints() {
        setImageViewConstraints()
        setTitleLabelConstraints()
    }
    
    private func setImageViewConstraints() {
        courseImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        courseImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        courseImageView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16).isActive = true
        courseImageView.bottomAnchor.constraint(equalTo: titleLabel.topAnchor).isActive = true
    }
    
    private func setTitleLabelConstraints() {
        titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16).isActive = true
        titleLabel.bottomAnchor.constraint(greaterThanOrEqualTo: self.bottomAnchor, constant: -8).isActive = true
    }
}
