//
//  EmployeeTypeTableViewController.swift
//  EmployeeRoster
//
//  Created by Aseel Alshohatee on 3/28/19.
//

import UIKit

protocol EmployeeTypeDelegate {
    func didSelect(employeeType: EmployeeType)
}

class EmployeeTypeTableViewController: UITableViewController {

    var delegate: EmployeeTypeDelegate? = nil
    var employeeType: EmployeeType? = nil
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return EmployeeType.all.count
    }

        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmployeeTypeCell", for: indexPath)

        // Configure the cell...
            let type: EmployeeType = EmployeeType.all[indexPath.row];
            cell.textLabel?.text = type.description();
            cell.accessoryType = employeeType == type ? .checkmark : .none;
            return cell;

    }
    

    
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
        tableView.deselectRow(at: indexPath, animated: false);
        employeeType = EmployeeType.all[indexPath.row];
        delegate?.didSelect(employeeType: employeeType!);

        tableView.reloadData();
    }
    
  

}
