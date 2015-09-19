//
//  VoiceViewController.swift
//  Lotería
//
//  Created by Karen Rodriguez Macias on 19/09/15.
//  Copyright © 2015 Karen Rodriguez Macias. All rights reserved.
//

import UIKit

class VoiceViewController: UIViewController {
    
    var CategoriesArrayOfImages: [String]!
    var i: Int = 1
    var n: Int = 0
    var HavePased: [String] = []
    @IBOutlet weak var VoiceImage: UIImageView!
    var timer = NSTimer()
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: "changeImage", userInfo: nil, repeats: true)
        self.navigationItem.title = "EL GRITÓN"
        i = 0
        n = CategoriesArrayOfImages.count
        HavePased = []
        VoiceImage.image = UIImage(named: CategoriesArrayOfImages[0])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func changeImage(){
        if i<n {
        VoiceImage.image = UIImage(named: CategoriesArrayOfImages[i])
        i=i+1
        }
    }
}
