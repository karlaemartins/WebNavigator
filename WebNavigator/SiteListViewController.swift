//
//  SiteListViewController.swift
//  WebNavigator
//
//  Created by Karla E. Martins Fernandes on 19/02/26.
//

import UIKit

class SiteListViewController: UIViewController {
    
    private let viewModel = SiteListViewModel()
    
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Web Navigator"
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        viewModel.delegate = self
        tableView.dataSource = self


    }

}

extension SiteListViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.sites.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")

        let site = viewModel.sites[indexPath.row]
        cell.textLabel?.text = site.absoluteString

        return cell
    }
}

extension SiteListViewController: SiteListViewModelDelegate {

    func didUpdateSites() {
        tableView.reloadData()
        
    }

}
