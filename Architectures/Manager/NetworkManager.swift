//
//  NetworkManager.swift
//  VIPER
//
//  Created by Maxim Baranets on 19.02.2020.
//  Copyright © 2020 Maxim Baranets. All rights reserved.
//

import Foundation

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private let courseListURL = URL(string: "https://swiftbook.ru//wp-content/uploads/api/api_courses")
    
    private init() {}
    
    func featchCourses(completion: @escaping ([Course]) -> Void) {
        guard let url = courseListURL else { return }
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard error == nil else { return }
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let courses = try decoder.decode([Course].self, from: data)
                completion(courses)
            } catch let error {
                print(error)
                print(error.localizedDescription)
            }
        }.resume()
    }
    
}
