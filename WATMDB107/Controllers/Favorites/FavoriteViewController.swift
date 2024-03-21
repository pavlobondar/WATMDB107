//
//  FavoriteViewController.swift
//  WATMDB107
//
//  Created by Pavlo on 21.03.2024.
//

import UIKit

class FavoriteViewController: UITableViewController {

    var coordinator: MainCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
}
