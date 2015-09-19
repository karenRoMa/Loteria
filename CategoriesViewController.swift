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
    var CategoriesArrayOfImagesVerbs: [String] = []
    var CategoriesArrayOfImagesObjects: [String] = []
    var CategoriesArrayOfImagesFruitsColors: [String] = []
    var option: Int!
    var optionCategory: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.Categories.delegate = self
        self.Categories.dataSource = self
        self.navigationItem.title = "CATEGORÍAS"
        CategoriesArray = ["Verbos","Objetos","Colores y Frutas"]
        CategoriesArrayOfImagesVerbs = []
        CategoriesArrayOfImagesObjects = []
        CategoriesArrayOfImagesFruitsColors = ["banana.png","Bueno.png","Chomp.png","Crunch.png","Crunchie.png","Lindt.png"]
        
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
                case "Verbos":
                anotherNextView.CategoriesArrayOfImages = CategoriesArrayOfImagesVerbs
                case "Objetos":
                anotherNextView.CategoriesArrayOfImages = CategoriesArrayOfImagesObjects
                case "Colores y Frutas":
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
