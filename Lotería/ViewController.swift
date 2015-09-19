//
//  ViewController.swift
//  Lotería
//
//  Created by Karen Rodriguez Macias on 19/09/15.
//  Copyright © 2015 Karen Rodriguez Macias. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var option: Int! = 2
    override func viewDidLoad() {
        super.viewDidLoad()
        self.option = 2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let nextView = segue.destinationViewController as! CategoriesViewController
        if segue.identifier == "VoiceSegue" {
            nextView.option = 1
        }
        else{
            nextView.option = option
        }
    }
}

