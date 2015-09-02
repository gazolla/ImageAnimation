//
//  MainViewController.swift
//  ImageAnimation
//
//  Created by Gazolla on 02/09/15.
//  Copyright (c) 2015 Gazolla. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var items:[String] = ["one", "two", "three","one", "two", "three","one", "two", "three", "four"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1.0)
        self.view.addSubview(self.collectionView)
    }
    
    lazy var collectionView:UICollectionView = {
        var cv = UICollectionView(frame: self.view.bounds, collectionViewLayout: self.flowLayout)
        cv.delegate = self
        cv.dataSource = self
        cv.bounces = true
        cv.alwaysBounceVertical = true
        cv.autoresizingMask = UIViewAutoresizing.FlexibleHeight | UIViewAutoresizing.FlexibleWidth
        cv.registerClass(CustomCell.self, forCellWithReuseIdentifier: "cell")
        cv.backgroundColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1.0)
        return cv
        }()
    
    lazy var flowLayout:UICollectionViewFlowLayout = {
        var flow = UICollectionViewFlowLayout()
        flow.sectionInset = UIEdgeInsetsMake(2.0, 2.0, 2.0, 2.0)
        return flow
        }()
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize{
        
        let width:CGFloat = self.view.bounds.size.width*0.98;
        let height:CGFloat = 150.0;
        return CGSizeMake(width, height)
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return self.items.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! CustomCell
        cell.layer.cornerRadius = 4
        cell.backgroundColor = UIColor.whiteColor()
        
        let animationArray = ["1","2","3","4","5", "6","7","8"].map{UIImage(named: $0)!}
        
        //-----------------
        //SOLUTION: add uiimage array to highlightedAnimationImages also
        cell.imgView.highlightedAnimationImages = animationArray
        cell.imgView.animationImages = animationArray
            
        cell.imgView.animationDuration = NSTimeInterval(0.8)
        cell.imgView.startAnimating()
        return cell
    }
    
    //-------------
    //SOLUTION: restart animation in didHighlightItemAtIndexPath
    func collectionView(collectionView: UICollectionView, didHighlightItemAtIndexPath indexPath: NSIndexPath) {
        if let cell = collectionView.cellForItemAtIndexPath(indexPath) as? CustomCell{
            cell.imgView.startAnimating()
        }

    }
    
    //-------------
    //SOLUTION: restart animation in didUnhighlightItemAtIndexPath
    func collectionView(collectionView: UICollectionView, didUnhighlightItemAtIndexPath indexPath: NSIndexPath) {
        if let cell = collectionView.cellForItemAtIndexPath(indexPath) as? CustomCell{
            cell.imgView.startAnimating()
        }
    }
    
    //-------------
    //SOLUTION: restart animation in didDeselectItemAtIndexPath
    func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath) {
        if let cell = collectionView.cellForItemAtIndexPath(indexPath) as? CustomCell{
            cell.imgView.startAnimating()
        }
    }
 
    //-----------
    //SOLUTION: restart animation in didSelectItemAtIndexPath
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        let cell = collectionView.cellForItemAtIndexPath(indexPath) as! CustomCell
        cell.imgView.startAnimating()
        
        var alert = UIAlertController(title: "Alert!", message: "Cell tapped", preferredStyle: UIAlertControllerStyle.Alert)
        var action = UIAlertAction(title: "ok", style: UIAlertActionStyle.Cancel) { (dd) -> Void in }
        alert.addAction(action)
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
}
