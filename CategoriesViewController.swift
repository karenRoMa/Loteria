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
    override func viewDidLoad() {
        super.viewDidLoad()
        self.Categories.delegate = self
        self.Categories.dataSource = self
        CategoriesArray = ["Verbos","Objetos","Colores y Frutas"]
        
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
}
