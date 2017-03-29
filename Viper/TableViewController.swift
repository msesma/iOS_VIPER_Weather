//
//  TableViewController.swift
//  Viper
//
//  Created by Miguel Sesma on 29/03/2017.
//  Copyright © 2017 Sesma. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController, viewProtocol{

    var presenter:Presenter?
    var objects:[String]?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let addItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.add, target: self, action: #selector(addNewObject))
        navigationItem.rightBarButtonItem = addItem
    }
    
    func addNewObject() {
        presenter!.addNewObject()
    }

     override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = objects?[indexPath.row] ?? ""
        return cell
    }
    
    func setListWithObjects(_ objects: [String]) {
        self.objects = objects
        tableView.reloadData()
    }

}
