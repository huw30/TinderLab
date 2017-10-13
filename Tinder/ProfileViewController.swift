//
//  ProfileViewController.swift
//  Tinder
//
//  Created by Raina Wang on 10/12/17.
//  Copyright © 2017 Raina Wang. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!

    var image: UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()
        profileImageView.image = image
    }
    @IBAction func onNavBarTap(_ sender: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
}
