//
//  MyTableViewController.swift
//  ArtistLookUp
//
//  Created by Charlithia Palmer on 6/26/20.
//

import UIKit


class MyTableViewController: UITableViewController, UISearchBarDelegate {

    let data = ["Drake", "2 Chainz", "21 Savage", "Ann Marie", "Asap Rocky", "Big Sean", "Cardi B", "Chance the Rapper", "Chris Brown", "DJ Khaled", "Ella Mai", "Fetty Wap", "Future", "Gucci Mane", "J. Cole", "Kendrick Lamar", "Khalid", "Lil Baby", "Migos", "Nicki Minaj", "Pusha T", "Rae Sremmurd", "Rick Ross"]
    
    var filteredData: [String]!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        filteredData = data
    
     
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return filteredData.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")! as UITableViewCell
    
        // Configure the cell
        cell.textLabel?.text = filteredData[indexPath.row]
    
        return cell
    }
    
    // MARK: Search Bar Config
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredData = []
        if searchText == "" {
            filteredData = data
        } else {
        for artist in data {
            
            if artist.lowercased().contains(searchText.lowercased()){
                
                filteredData.append(artist)
            }
          }
        }
        self.tableView.reloadData()
    }
}
