//
//  TableViewController.swift
//  HikingPlaces
//
//  Created by jear on 2018-11-03.
//  Copyright © 2018 jear. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    
    var hikingPlaces = ["Lake Laurentian Loop", "Lake Laurentian Conservation Area Trails", "Bell Park Walkway", "hiking place 4", "hiking place5"]
    
    
    var hikingImages = ["h1.jpg", "t1.jpg", "h3.jpg", "h4.jpg", "t2.jpg"]
    
    var arrayofVideos = ["https://www.youtube.com/embed/8K26WBQfVwg", "https://www.youtube.com/embed/qRNwJAUhZQM", "https://www.youtube.com/embed/MoUL65AdSEE", "https://www.youtube.com/embed/qMtNeHEYdZM", "https://www.youtube.com/embed/pX5RReU8GzQ"]
    

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

  
    
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return hikingPlaces.count
        
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "hikingcell", for: indexPath) as! TableViewCell

        cell.labelplaceholder.text = hikingPlaces[indexPath.row]
        cell.imgplaceholder.image = UIImage(named: hikingImages[indexPath.row])
        return cell
        
        
        
    }
    

    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       print("cell tapped")
        
        let video = arrayofVideos[indexPath.row]
        performSegue(withIdentifier: "TappedcellSegue", sender: video)
      
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let selectedcell = segue.destination as! ViewController
      
        
       /*-- selectedcell.tappedCell = "https://www.youtube.com/embed/tyd7-1BW1Zc" --*/
        
        selectedcell.tappedCell = sender as! String
                
    }
}
