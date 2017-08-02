//
//  TabBarViewController.swift
//  myFirstTvOSApp
//
//  Created by Pedro Francescon Cittolin on 02/08/17.
//  Copyright © 2017 codeMonkeys. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.tabBar.barTintColor = UIColor.brown
        //self.tabBar.tintColor = UIColor.red
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
