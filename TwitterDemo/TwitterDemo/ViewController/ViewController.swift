//
//  ViewController.swift
//  TwitterDemo
//
//  Created by iMac on 08/07/21.
//  Copyright © 2021 iMac. All rights reserved.
//

import UIKit
import TwitterKit

class ViewController: UIViewController {
    
    @IBOutlet weak var loginBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        loginBtn.layer.cornerRadius = 20
    }
    
    //MARK:- Button Clicks
    @IBAction func btnLoginTapped(_ sender: Any) {
        
        // Twitter SDK login call.
        TWTRTwitter.sharedInstance().logIn(with: self) { (session, error) in
            if let session = session{
                // Save data to user defaults for later use
                UserDefaults.standard.setValue(session.userID, forKey: "user_id")
                UserDefaults.standard.setValue(session.authToken, forKey: "auth_token")
                
                // Navigate user to Home screen
                let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                self.navigationController?.pushViewController(vc, animated: true)
                
            }else if let error = error{
                
                //Twitter SDK Login failed
                print("error :\(error.localizedDescription)")
            }
        }
    }
}

