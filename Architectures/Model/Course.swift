//
//  Course.swift
//  VIPER
//
//  Created by Maxim Baranets on 19.02.2020.
//  Copyright © 2020 Maxim Baranets. All rights reserved.
//

import Foundation

class Course: Codable {
    let name: String?
    let link: String?
    let imageUrl: String?
    let numberOfLessons: Int?
    let numberOfTests: Int?
    
    lazy var url: URL? = {
        if let stringUrl = self.imageUrl {
            return URL(string: stringUrl)
        }
        return nil
    }()
}
