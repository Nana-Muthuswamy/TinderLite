//
//  CardsViewController.swift
//  TinderLite
//
//  Created by Nana on 4/26/17.
//  Copyright © 2017 Nana. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!

    var profileImageInitialCenter: CGPoint!

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func panOnProfileImage(_ sender: UIPanGestureRecognizer) {

        let translation = sender.translation(in: view)

        if (sender.state == .began) {

            profileImageInitialCenter = profileImageView.center

        } else if (sender.state == .changed) {

            profileImageView.center = CGPoint(x: profileImageInitialCenter.x + translation.x, y: profileImageInitialCenter.y)
            
        } else if (sender.state == .ended) {
            
        }
    }

}

