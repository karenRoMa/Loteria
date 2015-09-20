//
//  CategoriesViewController.swift
//  Lotería
//
//  Created by Karen Rodriguez Macias on 19/09/15.
//  Copyright © 2015 Karen Rodriguez Macias. All rights reserved.
//

import UIKit

class CategoriesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var Categories: UITableView!
    var CategoriesArray: [String] = []
    var CategoriesArrayOfImagesObjects: [String] = []
    var CategoriesArrayOfImagesFruitsColors: [String] = []
    var option: Int!
    var optionCategory: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.Categories.delegate = self
        self.Categories.dataSource = self
        self.navigationItem.title = "CATEGORÍAS"
        CategoriesArray = ["Objetos","Colores y Frutas"]
        CategoriesArrayOfImagesObjects = ["backpack.jpg", "ball.jpg", "bell.jpg", "bicycle.jpg", "books.jpg", "boot.jpg", "brush.jpg", "bucketpaint.jpg", "camera.jpg", "cap.jpg", "car.jpg", "carrot.jpg", "cheese.jpg", "cloud.jpg", "computer.jpg", "couch.jpg", "drink.jpg", "duck.jpg", "factory.jpg", "fire.jpg", "flower.jpg", "footprint.jpg", "fork.jpg", "fridge.jpg", "gift.jpg", "glasses.jpg", "guitar.jpg", "hammer.jpg", "heart.jpg", "house.jpg", "jacket.jpg", "map.jpg", "microphone.jpg", "moustache.jpg", "music.jpg", "paintbrush.jpg", "pen.jpg", "pencil.jpg", "phone.jpg", "purse.jpg", "radio.jpg", "rocket.jpg", "ruler.jpg", "scissors.jpg", "screen.jpg", "shirt.jpg", "shoe.jpg", "short.jpg", "skirt.jpg", "sock.jpg", "star.jpg", "sun.jpg", "t-shirt.jpg", "tie.jpg", "tree.jpg", "troussers.jpg", "truck.jpg", "umbrella.jpg", "wallet.jpg", "weather.jpg"]
        CategoriesArrayOfImagesFruitsColors = ["apple.jpg","banana.jpg","banana.jpg","black.jpg","blue.jpg","brown.jpg","cherry.jpg","green.jpg","orange.jpg","pineapple.jpg","pink.jpg","purple.jpg","red.jpg","strawberry.jpg","white.jpg","yellow.jpg"]
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CategoriesArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("recycle") as UITableViewCell!
        if cell == nil{
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "recycle")
        }
        cell.textLabel?.text = CategoriesArray[indexPath.row]
        return cell
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        optionCategory = CategoriesArray[indexPath.row]
        if option == 1{
        self.performSegueWithIdentifier("VoiceSegue2", sender: self)
        }
        else{
        self.performSegueWithIdentifier("PlayerSegue2", sender: self)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if option == 1{
            var anotherNextView = segue.destinationViewController as! VoiceViewController
            switch optionCategory{
                case "Objetos":
                anotherNextView.numberOfElements = CategoriesArrayOfImagesObjects.count
                anotherNextView.CategoriesArrayOfImages = CategoriesArrayOfImagesObjects
                case "Colores y Frutas":
                anotherNextView.numberOfElements = CategoriesArrayOfImagesFruitsColors.count
                anotherNextView.CategoriesArrayOfImages = CategoriesArrayOfImagesFruitsColors
            default:
                anotherNextView.CategoriesArrayOfImages = []
            }
        }
        else{
            var anotherNextViewtoPlayer = segue .destinationViewController as! PlayerViewController
        }
    }
}
