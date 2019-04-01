//
//  ViewController.swift
//  SignUp
//
//  Created by 임성주 on 16/03/2019.
//  Copyright © 2019 jangre. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var idTextField: UITextField!
    @IBOutlet var signUpButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.idTextField.text = UserInformation.sharedInstance.id
    }
    
    @IBAction func tabGestureRecognizer(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    @IBAction func touchUpSignUpButton(_ sender: UIButton) {
        UserInformation.sharedInstance.date = nil
        UserInformation.sharedInstance.id = nil
        UserInformation.sharedInstance.phoneNumber = nil
    }
}

