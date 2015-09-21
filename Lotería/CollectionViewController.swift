//
//  CollectionViewController.swift
//  Lotería
//
//  Created by Vicente Guerra Hernández on 9/20/15.
//  Copyright © 2015 Karen Rodriguez Macias. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController {
    
    var numberOfElements: Int!
    var CategoriesArrayOfImages: [String]!
    var selected = [Bool]()
    var cardsRandom = [Int]()
    var completed: Int = 0;

    override func viewDidLoad() {
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        //self.collectionView!.registerClass(CollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 12 
    }
    
    // MARK: UICollectionViewFlowLayoutDelegate
    

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CollectionViewCell
        
        var isRepeat = true
        var random = Int(arc4random_uniform(UInt32(numberOfElements)))
        if (cardsRandom.count == 0){
            cardsRandom.append(random)
        }
        
        // Verifica repeticion, si ya existe el numero en cardsRandom[] genera otro nuevamente
        while(isRepeat){
            isRepeat = false
            for x in 0...cardsRandom.count-1{
                if (cardsRandom[x] == random){
                    //print("repetido \(x)")
                    isRepeat = true
                    random = Int(arc4random_uniform(UInt32(numberOfElements)))
                    break
                }
            }
        }
        cardsRandom.append(random)
        
        // Configure the cell
        let image = UIImage(named: CategoriesArrayOfImages[random])
        if image != nil
        {
            cell.imageView.image = image
            cell.markView.hidden = true
        }
        self.selected.append(false)
        
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath)
    {
        let cell = collectionView.cellForItemAtIndexPath(indexPath) as! CollectionViewCell
        
        if(self.selected[indexPath.row] == false){
            cell.markView.viewWithTag(0)?.hidden = false
            self.selected[indexPath.row] = true
            self.completed++;
        }else{
            cell.markView.viewWithTag(0)?.hidden = true
            self.selected[indexPath.row] = false
            self.completed--;
        }
        if(self.completed == 12){
            self.performSegueWithIdentifier("winner", sender: self)
            for cell in collectionView.visibleCells() as! [CollectionViewCell] {
                cell.markView.viewWithTag(0)?.hidden = true
            }
            
            for x in 0...self.selected.count-1{
                self.selected[x] = false
            }
            self.completed = 0
        }
        
    }
    
    //func restart(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath){
      //  let cell = collectionView.cellForItemAtIndexPath(indexPath) as! CollectionViewCell
        
    //}
    
    override func collectionView(collectionView: UICollectionView, didDeselectItemAtIndexPath indexPath: NSIndexPath)
    {
        
    }


    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */

}
