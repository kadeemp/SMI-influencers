//
//  FirstViewController.swift
//  SMI-Influencers
//
//  Created by Kadeem Palacios on 4/11/17.
//  Copyright © 2017 Kadeem Palacios. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit

class FirstViewController: UIViewController {

    override func viewWillAppear(_ animated: Bool) {
        print("hello")
        // feel free to move this stuff
        if ((FBSDKAccessToken.current()) != nil){
            print(FBSDKAccessToken.current().userID)
        } else {
            let loginButton = FBSDKLoginButton()
            loginButton.readPermissions = ["public_profile", "read_insights", "user_posts", "user_status", "user_videos", "read_audience_network_insights"]
            loginButton.center = self.view.center
            self.view.addSubview(loginButton)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

