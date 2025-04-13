//
//  ProfileViewController.swift
//  Capstone
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var profileNameLabel: UILabel!
    
    @IBOutlet weak var bioTextView: UITextView!
    
    var profile = Profile.getProfile()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileNameLabel.text = profile.name
        bioTextView.text = profile.bio
    }
    
}
