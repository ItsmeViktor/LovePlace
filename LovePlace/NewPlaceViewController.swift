//
//  NewPlaceViewController.swift
//  LovePlace
//
//  Created by viktor on 03.04.2022.
//

import UIKit

class NewPlaceViewController: UITableViewController {
    @IBOutlet var ImageOfPlace: UITableViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.tableFooterView = UIView ()
    }
// MARK: Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
        let actionSheet = UIAlertController(title: nil,
                                            message: nil, preferredStyle: .actionSheet)
            let camera = UIAlertAction(title: "Camera", style: .default) { _ in
                self.chooseImagePicker(source:  .camera)
            }
            
            let photo = UIAlertAction(title: "Photo", style: .default) { _ in
                self.chooseImagePicker(source: .photoLibrary)
            }
            
            let cancel = UIAlertAction(title: "Cancel", style: .cancel)
            
            actionSheet.addAction(camera)
            actionSheet.addAction(photo)
            actionSheet.addAction(cancel)
            
            present(actionSheet, animated: true)
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
// MARK: Work with image
extension NewPlaceViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func chooseImagePicker(source: UIImagePickerController.SourceType) {
        if UIImagePickerController.isSourceTypeAvailable(source) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing =  true
            imagePicker.sourceType = source
            present(imagePicker, animated: true)
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        ImageOfPlace.image = info[.editedImage] as? UIImage
        ImageOfPlace.contentMode = .scaleAspectFit
        ImageOfPlace.clipsToBounds = true
        dismiss(animated: true)
    }
}




