//
//  SettingsViewController.swift
//  WWtBM_GeekBrains
//
//  Created by Роман Шичкин on 16.08.2021.
//

import UIKit

class SettingsViewController: UIViewController {

    
    @IBOutlet weak var modeSegmentControl: UISegmentedControl!
    
    var selectedMode: Mode {
        switch modeSegmentControl.selectedSegmentIndex {
        case 0:
            return .consistent
        case 1:
            return .random
        default:
            return .consistent
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "fromSettingToMain":
            if let destination = segue.destination as? GameViewController {
                destination.mode = selectedMode
            }
        default:
            break
        }
    }


}
