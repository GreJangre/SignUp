//
//  SignUpViewController.swift
//  SignUp
//
//  Created by 임성주 on 31/03/2019.
//  Copyright © 2019 jangre. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {
    
    @IBOutlet var phonNumberTextField: UITextField!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var datePicker: UIDatePicker!
    @IBOutlet var cancleButton: UIButton!
    @IBOutlet var backButton: UIButton!
    @IBOutlet var signUpButton: UIButton!
    
    var datePickerValueChanged: Bool = false
    let dateFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateFormat = "MMMM dd, yyyy"
        
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dateLabel.text = self.dateFormatter.string(from: self.datePicker.date)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.phonNumberTextField.text = UserInformation.sharedInstance.phoneNumber
        self.dateLabel.text = self.dateFormatter.string(from: UserInformation.sharedInstance.date ?? self.datePicker.date)
        self.datePicker.date = UserInformation.sharedInstance.date ?? self.datePicker.date
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        UserInformation.sharedInstance.phoneNumber = self.phonNumberTextField.text
        UserInformation.sharedInstance.date = self.datePicker.date
    }
    
    override func viewWillLayoutSubviews() {
        if self.phonNumberTextField.text != "" && self.datePickerValueChanged == true {
            self.signUpButton.isEnabled = true
        } else {
            self.signUpButton.isEnabled = false
        }
    }
    
    @IBAction func touchUpBackButton (_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func touchUpCancelButton (_ sender: UIButton) {
        UserInformation.sharedInstance.date = nil
        UserInformation.sharedInstance.id = nil
        UserInformation.sharedInstance.phoneNumber = nil
    }
    
    @IBAction func didDatePickerValueChanged(_ sender: UIDatePicker) {
        self.datePickerValueChanged = true
        self.dateLabel.text = self.dateFormatter.string(from: sender.date)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}
