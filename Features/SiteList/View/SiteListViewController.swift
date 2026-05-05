//
//  SiteListViewController.swift
//  WebNavigator
//
//  Created by Karla E. Martins Fernandes on 19/02/26.
//

import UIKit

class SiteListViewController: UIViewController {
    
    private let viewModel: SiteListViewModel
    var coordinator: AppCoordinatorProtocol?
    
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    init(viewModel: SiteListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Sites Favoritos"
        
        navigationItem.backButtonTitle = ""
        
        view.addSubview(tableView)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(addSiteTapped)
        )
        
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        viewModel.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
        


    }
    
    @objc private func addSiteTapped() {
        
        let alert = UIAlertController(
            title: "Adicionar site",
            message: "Digite o endereço do site",
            preferredStyle: .alert
        )

        alert.addTextField { textField in
            textField.placeholder = "https://exemplo.com"
            textField.keyboardType = .URL
        }

        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel)

        let saveAction = UIAlertAction(title: "Salvar", style: .default) { _ in
            guard let text = alert.textFields?.first?.text else { return }
            self.viewModel.addSite(from: text)
        }

        alert.addAction(cancelAction)
        alert.addAction(saveAction)

        present(alert, animated: true)

    }
}

extension SiteListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.sites.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        
        cell.textLabel?.text = viewModel.displayName(for: indexPath.row)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView,
                   commit editingStyle: UITableViewCell.EditingStyle,
                   forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            viewModel.removeSite(at: indexPath.row)
        }
    }
}

extension SiteListViewController: SiteListViewModelDelegate {

    func didUpdateSites() {
        tableView.reloadData()
        
    }
    
    func didReachLimit() {
        coordinator?.showLimitAlert { [weak self] in
            self?.viewModel.clearSites()
        }
    }
    
    func didReceiveInvalidURL() {
        coordinator?.showInvalidURLAlert()
    }

}

extension SiteListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let site = viewModel.sites[indexPath.row]
        
        if let url = URL(string: site.url) {
            coordinator?.openSite(with: url)
        }
    }
}
