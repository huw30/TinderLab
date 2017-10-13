//
//  ViewController.swift
//  Tinder
//
//  Created by Raina Wang on 10/12/17.
//  Copyright © 2017 Raina Wang. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    @IBOutlet weak var profileImageView: DraggableImageView!
    fileprivate let profileSegue = "profileSegue"

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == profileSegue {
            let destination = segue.destination as! ProfileViewController
            
            destination.image = profileImageView.profileImage.image
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let cardImage = UIImage(named: "ryan")
        profileImageView.prepare(with: cardImage!)
    }
}

