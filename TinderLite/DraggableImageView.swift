//
//  DraggableImageView.swift
//  TinderLite
//
//  Created by Nana on 4/26/17.
//  Copyright © 2017 Nana. All rights reserved.
//

import UIKit

class DraggableImageView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var imageView: UIImageView!

    var image: UIImage? {
        get { return imageView.image }
        set { imageView.image = newValue }
    }

    var actualImageCenter: CGPoint!
    var initialImageCenter: CGPoint! // the last center when Pan Gesture began

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        // Custom setup
        initSubViews()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        // Custom setup
        initSubViews()
    }

    func initSubViews() {

        // Load and instantiate custom view xib
        let nib = UINib.init(nibName: "DraggableImageView", bundle: nil)
        nib.instantiate(withOwner: self, options: nil)

        // contentView outlet will be setup now. 
        // Setup the frame and add the subview.
        contentView.frame = bounds
        addSubview(contentView)

        actualImageCenter = imageView.center
    }

    @IBAction func panOnProfileImage(_ sender: UIPanGestureRecognizer) {

        let translation = sender.translation(in: superview)

        if (sender.state == .began) {

            initialImageCenter = imageView.center

        } else if (sender.state == .changed) {

            imageView.center = CGPoint(x: initialImageCenter.x + translation.x, y: initialImageCenter.y)

        } else if (sender.state == .ended) {

            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 1, options: [], animations: { 
                self.imageView.center = self.actualImageCenter
            }, completion: nil)
        }
    }

}
