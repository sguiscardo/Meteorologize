//
//  CityListTableViewController.swift
//  Meterologize
//
//  Created by Karl Pfister on 5/8/22.
//

import UIKit

class CityListTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return CityController.sharedInstance.cities.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cityCell", for: indexPath)
        
        let city = CityController.sharedInstance.cities[indexPath.row]
        cell.backgroundColor = city.currentTemp <= 80.0 ? .cyan : .red
        cell.textLabel?.text = city.name
        cell.detailTextLabel?.text = "\(city.currentTemp)F"
        
        return cell
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // MARK: - IIDOO
        /// Identifier - We are checking to see if the identifier of our segue matches "toDetailVC". If it does then we will run the code inside, if not then we will just pass over it.
        if segue.identifier == "toDetailVC" {
            /// Index - Discovering what row the user has seleceted
            if let index = tableView.indexPathForSelectedRow {
                /// Destination - Verifying the segues destination leads to the *ViewController* we want. This also allows us to access the properties on that *ViewController*
                if let destination = segue.destination as? CityDetailViewController {
                    /// Object to send - Using the index we discovered earlier we retrieve the *City* that matches in our *cities* array.
                    let city = CityController.sharedInstance.cities[index.row]
                    /// Object to receive - Sets the value of the optional *city* on the *destination* to the *city* we just retrived.
                    destination.city = city
                }
            }
        }
    }
}
