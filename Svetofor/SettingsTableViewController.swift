//
//  SettingsTableViewController.swift
//  Svetofor
//
//  Created by Андрей Дорогой on 31.10.2023.
//

import UIKit

class SettingsTableViewController: UITableViewController {

    @IBOutlet weak var timeRedLabel: UILabel!
    @IBOutlet weak var timeGreenLabel: UILabel!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var defaultsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSet()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        loadSet()
    }
    
    func loadSet() {
        timeRedLabel.text = "\(Settings.share.currentSettings.timeForRed) sec"
        timeGreenLabel.text = "\(Settings.share.currentSettings.timeForGreen) sec"
        
    }
    @IBAction func defaultsButtonAction(_ sender: Any) {
        Settings.share.resetSet()
        loadSet()
    }
    
    @IBAction func startButtonAction(_ sender: Any) {
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "selectTimeRed":
            if let vc = segue.destination as? SelectRedViewController {
                vc.data = [5, 10, 15, 20, 25, 30, 35, 40, 45, 50]
            }
        case "selectTimeGreen":
            if let vc = segue.destination as? SelectGreenViewController {
                vc.data = [5, 10, 15, 20, 25, 30, 35, 40, 45, 50]
            }
        default: break
        }
    }
    
}


