//
//  ViewController.swift
//  CruiseApp
//
//  Created by Noah Gerberick on 3/16/19.
//  Copyright © 2019 Noah Gerberick. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segmentationView: UISegmentedControl!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var buttonCollection: [UIButton]!
    
    var location: String!
    var events: [(String, String)] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        events = []
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let LVC = segue.destination as? LocationViewController {
            LVC.location = self.location
            LVC.events = self.events
        }
    }

    @IBAction func segmentationValueChanged(_ sender: Any) {
        if segmentationView.selectedSegmentIndex == 0 {
            imageView.image = UIImage(named: "cruise1")
        } else {
            imageView.image = UIImage(named: "cruise2")
        }
    }
    
    @IBAction func buttonClicked(_ sender: Any) {
        let element = (sender as! UIButton).tag + (3 * segmentationView.selectedSegmentIndex)
        switch element {
        case 0:
            location = "Dance Floor"
        case 1:
            location = "Bar"
        case 2:
            location = "Casino"
        case 3:
            location = "Pool Bar"
        case 4:
            location = "Pool"
        case 5:
            location = "BBQ"
        default:
            location = "error"
        }
        
        connectDatabase(url: "http://www.spectapp.net/CruiseApp/getEvents.php", postString: "location=\(location ?? "")", completion: { data in
            let xmlStrings: [String] = data.xml(key: "activity")
            print(xmlStrings)
            for xmlString in xmlStrings {
                self.events.append((xmlString.xml(key: "event_name"), xmlString.xml(key: "time")))
            }
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "showLocationSegue", sender: nil)
            }
        })
    }
}

