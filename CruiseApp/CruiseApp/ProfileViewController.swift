//
//  ProfileViewController.swift
//  CruiseApp
//
//  Created by Shivran Muralidhar on 3/17/19.
//  Copyright © 2019 Noah Gerberick. All rights reserved.
//

import UIKit
import WebKit

class ProfileViewController: UIViewController {
 
    let graphQLQuery = "{me{displayName, bitmoji{avatar}}}"
    
    let variables = ["page": "bitmoji"]

    @IBAction func tapInsta(_ sender: Any) {
        guard let url = URL(string: "https://www.instagram.com/shivran_/") else { return }
        UIApplication.shared.open(url)
        
    }
    
    @IBAction func Snapchat(_ sender: Any) {
        guard let url = URL(string: "https://www.snapchat.com/add/dictator28") else { return }
        UIApplication.shared.open(url)
        
  //      UIApplication.shared.openURL(URL(string: "https://www.snapchat.com/add/dictator28")!)
        
//        UIApplication.shared.openURL(NSURL(string: "https://www.snapchat.com/add/dictator28")! as URL)
    }

    @IBOutlet var pictures: WKWebView!
    


    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let picLink = URL(string: "https://www.pexels.com/search/vacation/")
        let myRequest = URLRequest(url: picLink!)
        pictures.load(myRequest)
        
    
        
//        SCSDKLoginClient.fetchUserData(withQuery: graphQLQuery, variables: variables, success: { (resources: [AnyHashable: Any]?) in
//            guard let resources = resources,
//                let data = resources["data"] as? [String: Any],
//                let me = data["me"] as? [String: Any] else { return }
//            
//            let displayName = me["displayName"] as? String
//            var bitmojiAvatarUrl: String?
//            if let bitmoji = me["bitmoji"] as? [String: Any] {
//                bitmojiAvatarUrl = bitmoji["avatar"] as? String
//            }
//        }, failure: { (error: Error?, isUserLoggedOut: Bool) in
//            // handle error
//        })
        
    }
    
    
    // logout
//    import SCSDKLoginKit
//
//    SCSDKLoginClient.unlinkCurrentSessionWithCompletion { (success: Bool) in
//    // do something
//    }


}
