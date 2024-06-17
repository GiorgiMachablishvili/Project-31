//
//  ViewController.swift
//  Project 31
//
//  Created by Gio's Mac on 17.06.24.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CountryViewCell.self, forCellReuseIdentifier: "CountryViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()
    
    private var territories: [Territory] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupConstraints()
        loadData()
    }
    
    func setup() {
        view.addSubview(tableView)
    }
    
    private func setupConstraints() {
        tableView.snp.remakeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func loadData() {
        let urlString = "https://restcountries.com/v3.1/all"
        guard let url = URL(string: urlString) else {
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            guard let self = self else { return }
            if let error = error {
                print("Error fetching data: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data returned")
                return
            }
            
            do {
                let territories = try JSONDecoder().decode([Territory].self, from: data)
                DispatchQueue.main.async {
                    self.territories = territories
                    self.tableView.reloadData()
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
        task.resume()
    }
}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return territories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CountryViewCell", for: indexPath) as? CountryViewCell else {
            return UITableViewCell()
        }
        let territory = territories[indexPath.row]
        cell.configuration(with: territory)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
