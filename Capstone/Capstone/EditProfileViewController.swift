//
//  EditProfileViewController.swift
//  Capstone
//

import UIKit

class EditProfileViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var bioField: UITextField!
    
    var editProfile: ((Profile) -> Void)? = nil

    override func viewDidLoad() {
        
        super.viewDidLoad()
    }

    @IBAction func didTapSaveButton(_ sender: Any) {

        guard let name = nameField.text,
              !name.isEmpty
        else {
            presentAlert(title: "Error", message: "Please Enter a Profile Name")
            return
        }
        
        let profile = Profile(name: name, bio: bioField.text)
        
        Profile.save(profile, forKey: Profile.profileKey)
        
        editProfile?(profile)

        dismiss(animated: true)
    }

    @IBAction func didTapBackButton(_ sender: Any) {
        dismiss(animated: true)
    }

    private func presentAlert(title: String, message: String) {

        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert)

        let okAction = UIAlertAction(title: "OK", style: .default)

        alertController.addAction(okAction)

        present(alertController, animated: true)
    }
}
