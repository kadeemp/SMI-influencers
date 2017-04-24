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

class SignInViewController: UIViewController, FBSDKLoginButtonDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        print("\n")
//        print(FBSDKAccessToken.current().tokenString)
//        print(FBSDKAccessToken.current().permissions)
//        print("viewdidload")
        
        let loginButton = FBSDKLoginButton()
        
        view.addSubview(loginButton)
        loginButton.readPermissions = ["email", "public_profile", "read_insights", "user_posts", "user_status", "user_videos", "read_audience_network_insights"]
        loginButton.publishPermissions = ["manage_pages"]

        //use constraints to place the button in the right place.
        loginButton.frame = CGRect(x: 35, y: 430, width: view.frame.width - 70, height: 50)
        loginButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        loginButton.layer.cornerRadius = 6.0
        
        loginButton.delegate = self
        

        
        /*
        let customFBButton = UIButton()
        customFBButton.backgroundColor = UIColor.blue
        customFBButton.frame = CGRect(x: 16, y: 400, width: view.frame.width - 32, height: 50)
        customFBButton.setTitle("Log in with Facebook", for: .normal)
        customFBButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        customFBButton.setTitleColor(.white, for: .normal)
        customFBButton.layer.cornerRadius = 8.0
        
        view.addSubview(customFBButton)
        */
    }

    func loginButtonDidLogOut(_ loginButton: FBSDKLoginButton!) {
        print("User successfully logged out.")
    }
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error != nil {
            print(error)
            return
        }
        
        print(FBSDKAccessToken.current().tokenString)
        print(FBSDKAccessToken.current().permissions)
        print("\n hello")
        
        FBSDKGraphRequest(graphPath: "/me", parameters: ["fields": "id, name, email"]).start {
            (connection, result, err) in
            
            if err != nil {
                print("Failed to start graph request:", err)
                return
            }
            print(result)
            
            print(FBSDKAccessToken.current().tokenString)
            print(FBSDKAccessToken.current().permissions)
            print("\n req")
        }
    }


}

