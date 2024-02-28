//
//  SelectRedViewController.swift
//  Svetofor
//
//  Created by Андрей Дорогой on 31.10.2023.
//

import UIKit

class SelectRedViewController: UIViewController {
    
    var data: [Int] = []
    
    @IBOutlet weak var redTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        redTableView.dataSource = self
        redTableView.reloadData()
        redTableView.delegate = self
    }
}

    extension SelectRedViewController: UITableViewDataSource, UITableViewDelegate {
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return data.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "timeCell", for: indexPath)
            cell.textLabel?.text = "\(String(data[indexPath.row])) sec"
            return cell
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            tableView.deselectRow(at: indexPath, animated: true)
            Settings.share.currentSettings.timeForRed = data[indexPath.row]
            navigationController?.popViewController(animated: true)
        }
        
    }
  
    
