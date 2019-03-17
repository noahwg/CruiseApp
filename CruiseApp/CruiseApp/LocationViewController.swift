//
//  LocationViewController.swift
//  CruiseApp
//
//  Created by Noah Gerberick on 3/16/19.
//  Copyright © 2019 Noah Gerberick. All rights reserved.
//

import UIKit

class LocationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var location: String!
    var events: [(String, String)] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = location
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "eventTableViewCell") as! EventTableViewCell
        cell.titleLabel.text = events[indexPath.row].0
        cell.timeLabel.text = "Time: " + events[indexPath.row].1
        cell.joinLabel.tag = indexPath.row
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 137
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
