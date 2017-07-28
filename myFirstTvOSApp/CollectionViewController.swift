//
//  CollectionViewController.swift
//  myFirstTvOSApp
//
//  Created by Rodrigo Guimaraes on 27/07/17.
//  Copyright © 2017 codeMonkeys. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController {
    
    var imageArray = ["Aston1.jpg", "Audi1.jpg", "bmw1.jpg", "Bugatti1.jpg", "Ferrari1.jpg", "Lamborghini1.jpg", "Mclaren1.jpg", "Mercedes1.jpg"]
    
    var sectionsDictionary = [Character : Int]()
    var sectionsTitles = [Character]()
    var sectionInit = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
        //Break the items according to the first letter - set the first letter as titles
        for image in imageArray {
            let initialChar = image.uppercased().characters.first!
            if let count = sectionsDictionary[initialChar]
            {
                sectionsDictionary[initialChar] = count + 1
            }
            else
            {
                sectionsDictionary[initialChar] = 1
                sectionsTitles.append(initialChar)
            }
        }
        
        //Count the inits
        var count = 0
        for i in 0..<sectionsTitles.count{
            sectionInit.append(count)
            count += sectionsDictionary[sectionsTitles[i]]!
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails" {
            if let indexPath = collectionView?.indexPath(for: sender as! UICollectionViewCell)
            {
                let detailVC = (segue.destination as! DetailViewController)
                detailVC.sentData = imageArray[sectionInit[indexPath.section] + indexPath.row]
            }
        }
    }

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sectionsDictionary.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
            case UICollectionElementKindSectionHeader:
                let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "sectionHeader", for: indexPath) as! SectionHeader
                headerView.titleLabel.text = String(sectionsTitles[indexPath.section])
                return headerView
            default:
                assert(false, "Unexpected element kind")
        }
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(sectionsDictionary[sectionsTitles[section]]!)
        return sectionsDictionary[sectionsTitles[section]]!
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        cell.cellImageView.image = UIImage(named: imageArray[sectionInit[indexPath.section] + indexPath.row])
        
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
