//
//  NewPlaceViewController.swift
//  LovePlace
//
//  Created by viktor on 03.04.2022.
//

import UIKit

class NewPlaceViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView ()
    }
// MARK: Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            
        } else {
            view.endEditing(true)
        }
    }
   
}
// MARK: Textfield delegate
extension NewPlaceViewController: UITextFieldDelegate {
    
    // go invisible keyboard when tap "done"
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
