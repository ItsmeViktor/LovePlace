//
//  MainViewController.swift
//  LikePlace
//
//  Created by viktor on 30.03.2022.
//

import UIKit

class MainViewController: UITableViewController {
    
 
    
    let places = Place.getPlaces()
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return places.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        
        cell.TypeLabel.text = places[indexPath.row].type
        cell.LocationLabel.text = places[indexPath.row].location
        cell.NameLabel?.text = places[indexPath.row].name
        cell.ImageOfPlace?.image = UIImage(named: places[indexPath.row].image)
        cell.ImageOfPlace?.layer.cornerRadius = cell.ImageOfPlace.frame.size.height / 2
        cell.ImageOfPlace?.clipsToBounds = true
        return cell
        
    }

    
    
    /*
    //; MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func cancelAction(_ segue: UIStoryboardSegue) {}
    
}
