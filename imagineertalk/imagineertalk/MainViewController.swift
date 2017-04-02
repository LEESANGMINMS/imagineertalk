//
//  MainViewController.swift
//  imagineertalk
//
//  Created by sang minlee on 2017. 4. 2..
//  Copyright © 2017년 LeeSangMin.house. All rights reserved.
//

import UIKit
import FirebaseAuth

class MainViewController: UIViewController {

    @IBOutlet weak var emailLabel: UILabel!
    var handle:FIRAuthStateDidChangeListenerHandle?
    
    @IBAction func logoutButtonPressed(_ sender: Any) {
        
        do {
            try FIRAuth.auth()?.signOut()
            self.navigationController?.popToRootViewController(animated: true)
        } catch {
            print("signOut failed")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        handle = FIRAuth.auth()?.addStateDidChangeListener() { (auth, user) in
        
        if let user = auth.currentUser {
            self.emailLabel.text = user.email
        } else {
            self.emailLabel.text = "로그아웃 됨"
            }
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
