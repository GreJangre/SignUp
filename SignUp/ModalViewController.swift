//
//  ModalViewController.swift
//  SignUp
//
//  Created by 임성주 on 30/03/2019.
//  Copyright © 2019 jangre. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var idField: UITextField!
    @IBOutlet var passField: UITextField!
    @IBOutlet var checkPassField: UITextField!
    @IBOutlet var introduceTextView: UITextView!
    @IBOutlet var cancelButton: UIButton!
    @IBOutlet var doneButton: UIButton!
    
    lazy var imagePicker: UIImagePickerController = {
        let picker: UIImagePickerController = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.allowsEditing = true
        picker.delegate = self
        
        return picker
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        if ((self.imageView?.image) != nil) && self.idField.hasText && self.passField.hasText && self.introduceTextView.hasText && self.passField.text == self.checkPassField.text {
            self.doneButton.isEnabled = true
        } else {
            self.doneButton.isEnabled = false
        }
    }
    
    @IBAction func touchUpCancelButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func touchUpDoneButton(_ sender: UIButton) {
        UserInformation.sharedInstance.id = self.idField.text
    }
    
    @IBAction func tabImageView(_ sender: UITapGestureRecognizer) {
        self.present(self.imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func tabView(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imageView = info[UIImagePickerController.InfoKey.editedImage] as? UIImage? {
            self.imageView.image = imageView
        }
        
        self.dismiss(animated: true, completion: nil)
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
