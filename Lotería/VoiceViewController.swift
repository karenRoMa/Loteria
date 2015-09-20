//
//  VoiceViewController.swift
//  Lotería
//
//  Created by Karen Rodriguez Macias on 19/09/15.
//  Copyright © 2015 Karen Rodriguez Macias. All rights reserved.
//

import UIKit
import AVFoundation

class VoiceViewController: UIViewController {
    
    var CategoriesArrayOfImages: [String]!
    var i: Int = 1
    var n: Int = 0
    var HavePased: [String] = []
    var Light: String?
    let synth = AVSpeechSynthesizer()
    var textToVoice: String?
    var myUtterance = AVSpeechUtterance(string: "")
    @IBOutlet weak var VoiceImage: UIImageView!
    @IBOutlet weak var PauseButtonOutlet: UIButton!
    @IBOutlet weak var phrase: UILabel!
    @IBOutlet weak var StartButtonOutlet: UIButton!
    var timer = NSTimer()
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = NSTimer.scheduledTimerWithTimeInterval(2, target: self, selector: "changeImage", userInfo: nil, repeats: true)
        self.navigationItem.title = "EL GRITÓN"
        i = 0
        n = CategoriesArrayOfImages.count
        HavePased = []
        VoiceImage.image = UIImage(named: CategoriesArrayOfImages[0])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func StartButton(sender: AnyObject) {
        Light = "ON"
        StartButtonOutlet.highlighted = true
        StartButtonOutlet.enabled = false
        PauseButtonOutlet.highlighted = false
        PauseButtonOutlet.enabled = true
    }

    @IBAction func PauseButton(sender: AnyObject) {
        Light = "OFF"
        PauseButtonOutlet.highlighted = true
        PauseButtonOutlet.enabled = false
        StartButtonOutlet.highlighted = false
        StartButtonOutlet.enabled = true
    }
    
    func changeImage(){
        if Light == "ON"{
            if i<n {
                textToVoice = CategoriesArrayOfImages[i].stringByReplacingOccurrencesOfString(".jpg", withString: "")
                myUtterance = AVSpeechUtterance(string: textToVoice!)
                myUtterance.rate = 0.3
                synth.speakUtterance(myUtterance)
                VoiceImage.image = UIImage(named:CategoriesArrayOfImages[i])
                i=i+1
            }
        }
    }
}
