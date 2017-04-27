//
//  CardsViewController.swift
//  TinderLite
//
//  Created by Nana on 4/26/17.
//  Copyright © 2017 Nana. All rights reserved.
//

import UIKit

class CardsViewController: UIViewController {

    @IBOutlet weak var draggableImageView: DraggableImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        draggableImageView.image = UIImage(named: "ryan")
    }
}

