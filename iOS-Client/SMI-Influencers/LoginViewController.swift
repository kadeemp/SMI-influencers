//
//  LoginViewController.swift
//  SMI-Influencers
//
//  Created by Fanisa Kimberly Mlangeni on 4/17/17.
//  Copyright © 2017 Kadeem Palacios. All rights reserved.
//

import UIKit
import FBSDKLoginKit
import FBSDKCoreKit
import TwitterKit
import Crashlytics
import KeychainSwift

class LoginViewController: UIViewController {
    let keychain = KeychainSwift()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupFacebookLogin()
        setupTwitterSignInButton()
        
        //Background color of the view controller.
        self.view.backgroundColor = UIColor(red: 55/255, green: 63/255, blue: 81/255, alpha: 1)
    }
    
    
    fileprivate func setupFacebookLogin() {
        
        //add custom sign in button with facebook image logo.
        let customFBButton = UIButton()
        customFBButton.backgroundColor = UIColor(red: 71/255, green: 89/255, blue: 147/255, alpha: 1)
        //TODO: Set the constraints you need. dont forget Fanisa!
        
        
        //use constraints to place the button in the right place.
        customFBButton.frame = CGRect(x: 35, y: 365, width: view.frame.width - 70, height: 50)
        customFBButton.setTitle("Sign in with Facebook", for: .normal)
        customFBButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        customFBButton.setTitleColor(.white, for: .normal)
        customFBButton.layer.cornerRadius = 6.0
        
        view.addSubview(customFBButton)
        
        //add the Facebook logo to the FB button.
        let facebookImageName = "facebook.png"
        let facebookImage = UIImage(named: facebookImageName)
        let facebookImageView = UIImageView(image: facebookImage)
        
        facebookImageView.frame = CGRect(x: 30  , y: 15, width: 20, height: 20)
        customFBButton.addSubview(facebookImageView)
        
        customFBButton.addTarget(self, action: #selector(handleCustomLogin), for: .touchUpInside)
    }
    
    func handleCustomLogin() {
        
        FBSDKLoginManager().logIn(withPublishPermissions: ["manage_pages"], from: self) { (result, error) in
            if error != nil {
                print ("did not auth pages")
                return
            }
            let token = FBSDKAccessToken.current().tokenString!
            self.keychain.set(token, forKey: "FBToken")
            print(FBSDKAccessToken.current().tokenString)
            print(FBSDKAccessToken.current().permissions)
            
            FBSDKLoginManager().logIn(withReadPermissions: ["email", "public_profile", "read_insights", "user_posts", "user_status", "user_videos", "read_audience_network_insights"], from: self) { (result, err) in
                if err != nil {
                    print("Custom FB Login failed:" , err)
                    return
                }
                self.showEmailAddress()
                print(FBSDKAccessToken.current().tokenString)
            }

        }
        
        
        
    }
    
    
    func loginButton(_ loginButton: FBSDKLoginButton!, didCompleteWith result: FBSDKLoginManagerLoginResult!, error: Error!) {
        if error != nil {
            print(error)
            return
        }
        
        showEmailAddress()
    }
    
    func showEmailAddress() {
        let accessToken = FBSDKAccessToken.current()
        guard let accessTokenString = accessToken?.tokenString else {return}
        print(accessTokenString)
        
        FBSDKGraphRequest(graphPath: "/me", parameters: ["fields": "id, name, email"]).start {
            (connection, result, err) in
            
            if err != nil {
                print("Failed to start graph request:", err)
                return
            }
            print(result)
        }
        
    }
    
    
    //Setup the Twitter button.
    fileprivate func setupTwitterSignInButton() {
        //add custom sign in button with facebook image logo.
        let customTwitterButton = UIButton()
        customTwitterButton.backgroundColor = UIColor(red: 0/255, green: 163/255, blue: 236/255, alpha: 1)
        
        
        //TODO: Set the constraints you need. Don't forget Fanisa!
        
        //use constraints to place the button in the right place.
        customTwitterButton.frame = CGRect(x: 35, y: 430, width: view.frame.width - 70, height: 50)
        customTwitterButton.setTitle("Sign in with Twitter", for: .normal)
        customTwitterButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        customTwitterButton.setTitleColor(.white, for: .normal)
        customTwitterButton.layer.cornerRadius = 6.0
        
        view.addSubview(customTwitterButton)
        
        //add the Facebook logo to the FB button.
        let twitterImageName = "twitter.png"
        let twitterImage = UIImage(named: twitterImageName)
        let twitterImageView = UIImageView(image: twitterImage)
        
        twitterImageView.frame = CGRect(x: 30  , y: 15, width: 20, height: 20)
        customTwitterButton.addSubview(twitterImageView)
        
        customTwitterButton.addTarget(self, action: #selector(handleTwitterLogin), for: .touchUpInside)
    }
    
    fileprivate func naviagateToMainScreen() {
        performSegue(withIdentifier: "", sender: self)
    }
    
    func handleTwitterLogin() {
        Twitter.sharedInstance().logIn { session, error in
            if session != nil {
                DispatchQueue.main.async {
                    // Navigate to the main app screen to select a theme.
                    self.naviagateToMainScreen()
                }
                
                // Tie crashes to a Twitter user ID and username in Crashlytics.
                Crashlytics.sharedInstance().setUserIdentifier(session!.userID)
                Crashlytics.sharedInstance().setUserName(session!.userName)
                
                // Log Answers Custom Event.
                Answers.logLogin(withMethod: "Twitter", success: true, customAttributes: ["User ID": session!.userID])
            } else {
                // Log Answers Custom Event.
                Answers.logLogin(withMethod: "Twitter", success: false, customAttributes: ["Error": error!.localizedDescription])
            }
        }
        
    }
    
    
    
}
