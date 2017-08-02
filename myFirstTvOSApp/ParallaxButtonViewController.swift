//
//  ParallaxButtonViewController.swift
//  myFirstTvOSApp
//
//  Created by Pedro Francescon Cittolin on 01/08/17.
//  Copyright © 2017 codeMonkeys. All rights reserved.
//

import UIKit

class ParallaxButtonViewController: UIViewController {

    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        button.imageView?.adjustsImageWhenAncestorFocused = true
        button.imageView?.clipsToBounds = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
