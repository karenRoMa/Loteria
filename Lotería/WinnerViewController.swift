//
//  WinnerViewController.swift
//  Lotería
//
//  Created by Vicente Guerra Hernández on 9/21/15.
//  Copyright © 2015 Karen Rodriguez Macias. All rights reserved.
//

import UIKit

class WinnerViewController: UIViewController {
    
    @IBOutlet weak var ganasteImage: UIImageView!
    @IBOutlet weak var volverButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func volverAction(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    /*
    // MARK: - Navigation
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}