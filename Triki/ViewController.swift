//
//  ViewController.swift
//  Triki
//
//  Created by Santiago Carmona gonzalez on 2/22/16.
//  Copyright © 2016 Santiago Carmona's. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let reuseIdentifier = "Cell"
    var user:Bool = false
    var myView:UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView!.backgroundColor = UIColor.blackColor()
        self.myView = UIView(frame: CGRect(x: 0, y: self.collectionView.frame.height/3, width: 7, height: self.collectionView.frame.height - 20))
        self.myView.backgroundColor = UIColor.redColor()
        self.myView.hidden = true
        self.view.addSubview(myView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // MARK : Collection view source
    
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }
    
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 3
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! TrikiCell
        cell.backgroundColor = UIColor.whiteColor()
        cell.label.text = ""
        // Configure the cell
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.cellForItemAtIndexPath(indexPath) as! TrikiCell
        print("Selected")
        let section = collectionView.cellForItemAtIndexPath(NSIndexPath(forItem: indexPath.row, inSection: 1)) as! TrikiCell
        print(cell.frame)
        self.drawLine(cell.frame)
        //self.drawLine(section.frame)
        if cell.label.text == ""{
            if user {
                cell.label.text = "O"
                user = false
            } else {
                cell.label.text = "X"
                user = true
            }
        }
    }
    
    func drawLine(bounds:CGRect){
        var isHorizontal = false
        var isVertical = false
        var isHorizontalToLeft = false
        if isHorizontal {
            self.myView.frame.origin.x = bounds.origin.x + bounds.width/2
            self.myView.frame.origin.y = bounds.origin.y + 10
            self.myView.hidden = false
        } else if isVertical {
            self.myView.frame.origin.x = self.collectionView.bounds.origin.x
            print(bounds.origin.y)
            self.myView.frame.origin.y = bounds.origin.y + 175
            self.myView.frame.size.width = self.collectionView.bounds.width
            self.myView.frame.size.height = 7
            self.myView.hidden = false
        } else {
            self.myView.frame.origin.x = self.collectionView.frame.origin.x
            self.myView.frame.origin.y = self.collectionView.frame.height - 25
            self.myView.frame.size.width = self.collectionView.bounds.width
            self.myView.frame.size.height = 10
            self.myView.transform =  CGAffineTransformMakeRotation(CGFloat(isHorizontalToLeft ? -90.35 : 90.35))
            self.myView.hidden = false
        }
    }
}

extension ViewController : UICollectionViewDelegateFlowLayout {
    //1
    func collectionView(collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
            return CGSize(width: self.view.frame.size.width / 3 - 10, height: self.view.frame.size.width / 3 - 9);
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        if section == 0 {
            return UIEdgeInsetsMake(0, 0, 0, 0)
        } else {
            return UIEdgeInsetsMake(10, 0, 0, 0)
        }
    }
    
}

