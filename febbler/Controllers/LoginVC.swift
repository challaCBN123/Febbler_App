//
//  LoginVC.swift
//  febbler
//
//  Created by Bhargava on 28/08/20.
//  Copyright © 2020 Bhargava. All rights reserved.
//

import UIKit
import GoogleSignIn
import FirebaseAuth
class LoginVC: UIViewController,GIDSignInDelegate   {
  
    @IBOutlet weak var loginView: GIDSignInButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance()?.presentingViewController = self
        GIDSignIn.sharedInstance()?.signIn()
        GIDSignIn.sharedInstance()?.delegate = self
     
    }
   func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
     
          if let error = error {
              print("\(error.localizedDescription)")
          } else {
          
              let storyboard = UIStoryboard(name: "Main", bundle: nil)
              let tabbarVC = storyboard.instantiateViewController(withIdentifier: "ProfileVC") as! ProfileVC
              self.present(tabbarVC, animated: false, completion: nil)
           
          }
      
     }
     func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        if error != nil {
            print(error.localizedDescription)
             }
          
        self.navigationController?.dismiss(animated: true, completion: nil)
         
     }
 
    @IBAction func didTapBack(_ sender:UIBarButtonItem){
        self.dismiss(animated: true, completion: nil)
    }
   
}
