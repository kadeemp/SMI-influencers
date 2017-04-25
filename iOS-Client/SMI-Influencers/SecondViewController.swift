//
//  SecondViewController.swift
//  SMI-Influencers
//
//  Created by Kadeem Palacios on 4/11/17.
//  Copyright © 2017 Kadeem Palacios. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let navBarTitleButton: UIButton = UIButton(frame: CGRect(x: 155, y: 0, width: 100, height: 50))
        navBarTitleButton.backgroundColor = UIColor.clear
        //TODO:- Add a variable that changes depending on who is signed in
        navBarTitleButton.setTitle("Kadeem Palacios", for: .normal)
        navBarTitleButton.addTarget(self, action: #selector(navBarButtonAction), for: .touchUpInside)
        navBarTitleButton.tag = 1
      
        self.navigationItem.titleView = navBarTitleButton
        //let titleButtton = UIButton(frame: CGRect)
       
        
        
        
        
    }

    @IBOutlet weak var profilePicture: UIImageView!
    
    //Create an instance of the fb login view controller.
    
    func navBarButtonAction(sender: UIButton!) {
        let alert = UIAlertController(title: "Alert Title", message: "Would you like to logout?", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Logout", style: .destructive) { action in
            // perhaps use action.title here
        })
        alert.addAction(UIAlertAction(title: "Cancel", style: .default) { action in
            // perhaps use action.title here
        })
        var btnsendtag: UIButton = sender
        if btnsendtag.tag == 1 {
            self.present(alert, animated: true)
        }
    }


}

