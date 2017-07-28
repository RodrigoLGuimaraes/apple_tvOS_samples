//
//  DetailViewController.swift
//  myFirstTvOSApp
//
//  Created by Rodrigo Guimaraes on 27/07/17.
//  Copyright © 2017 codeMonkeys. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var sentData : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageView.image = UIImage(named: sentData)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didOrder(_ sender: Any) {
        let alertController = UIAlertController(title: "Order Unsuccessful", message: "Who are you kidding? You do not have money for that!", preferredStyle: .alert)
        
        let defaultAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        let destrutiveAction = UIAlertAction(title: "Sell a kidney", style: .destructive, handler:  {
            (_) in
            //DO SOMETHING HERE
        })
        alertController.addAction(destrutiveAction)
        alertController.addAction(defaultAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
