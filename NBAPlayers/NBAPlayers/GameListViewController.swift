//
//  GameListViewController.swift
//  NBAPlayers
//
//  Created by Евгений Матвеев on 28.08.2021.
//

import UIKit

class GameListViewController: UIViewController, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:  "GameInfo", for: indexPath)
        
        cell.textLabel?.text = "Row \(indexPath.row)"
        return cell
    }
    
}
 
