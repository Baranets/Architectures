//
//  CourseListCollectionViewController.swift
//  VIPER
//
//  Created by Maxim Baranets on 04.02.2020.
//  Copyright © 2020 Maxim Baranets. All rights reserved.
//

import Foundation
import UIKit

protocol CourseListViewProtocol: class {
    
    func reloadTable()
    
}

class CourseListTableViewController: UITableViewController {
    
    private let configurator: CourseListConfiguratorProtocol = CourseListConfigurator()
    
    let showDetailViewControllerSegueIdentifier = "showDetail"
    
    var presenter: CourseListPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(CourseTableViewCell.self,
                           forCellReuseIdentifier: CourseTableViewCell.cellIdentifier)
        
        tableView.rowHeight = 400
        
        configurator.configure(with: self)
        presenter.viewDidLoad()
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case showDetailViewControllerSegueIdentifier:
            guard
                let detailVC = segue.destination as? CourseDetailViewController,
                let course = sender as? Course
            else { return }
            
            let configurator = CourseDetailConfigurator()
            configurator.configure(with: detailVC, course: course)
        default:
            return
        }
    }
    
    // MARK: - UITableViewDataSource
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.coursesCount
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: CourseTableViewCell.cellIdentifier,
            for: indexPath) as? CourseTableViewCell
        else {
            return UITableViewCell()
        }
        
        cell.course = presenter.course(for: indexPath)

        return cell
    }
    
    // MARK: - UITableViewDelegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.showDetails(for: indexPath)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension CourseListTableViewController: CourseListViewProtocol {
    
    func reloadTable() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
}
