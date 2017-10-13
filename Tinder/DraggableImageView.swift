//
//  DraggableImageView.swift
//  Tinder
//
//  Created by Raina Wang on 10/12/17.
//  Copyright © 2017 Raina Wang. All rights reserved.
//

import UIKit

class DraggableImageView: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var profileImage: UIImageView!

    fileprivate var imageOriginalCenter: CGPoint!
    fileprivate let animateDuration = 0.3

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initSubviews()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }

    fileprivate func initSubviews() {
        let nib = UINib(nibName: "DraggableImageView", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)
        contentView.frame = bounds
        addSubview(contentView)
    }

    func prepare(with image: UIImage) {
        self.profileImage.image = image
    }
    
    @IBAction func onImagePan(_ sender: UIPanGestureRecognizer) {
        let panGestureRecognizer = sender
        let translation = panGestureRecognizer.translation(in: contentView)
        let panLocation = panGestureRecognizer.location(in: contentView)

        if panGestureRecognizer.state == .began {
            imageOriginalCenter = profileImage.center
        } else if panGestureRecognizer.state == .changed {
            if panLocation.y >= imageOriginalCenter.y {
                profileImage.transform = CGAffineTransform(rotationAngle: (-translation.x / 10).degreesToRadians)
            } else {
                profileImage.transform = CGAffineTransform(rotationAngle: (translation.x / 10).degreesToRadians)
            }
            profileImage.center = CGPoint(x: imageOriginalCenter.x + translation.x, y: imageOriginalCenter.y)
        } else if panGestureRecognizer.state == .ended {
            if translation.x > 50 {
                UIView.animate(withDuration: animateDuration, animations: {
                    self.profileImage.center.x = 1000
                })
            } else if translation.x < -50 {
                UIView.animate(withDuration: animateDuration, animations: {
                    self.profileImage.center.x = -1000
                })
            } else {
                UIView.animate(withDuration: animateDuration, animations: {
                    self.profileImage.transform = CGAffineTransform.identity
                    self.profileImage.center = self.imageOriginalCenter
                })
            }
        }
    }
}
