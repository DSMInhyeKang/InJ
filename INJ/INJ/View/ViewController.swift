//
//  ViewController.swift
//  INJ
//
//  Created by 강인혜 on 2022/05/31.
//

import UIKit
import AVFoundation
import MobileCoreServices

class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    @IBOutlet weak var readView: UIView!
    
    let imagePicker: UIImagePickerController! = UIImagePickerController()
    var captureImage: UIImage!
    var flagImgaveSave = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func scanBtn(_ sender: UIButton) {
        if (UIImagePickerController.isSourceTypeAvailable(.camera)) {
            flagImgaveSave = true
            
            imagePicker.delegate = self
            imagePicker.sourceType = .camera
            imagePicker.mediaTypes = [kUTTypeImage as String]
            imagePicker.allowsEditing = false
            
            
            present(imagePicker, animated: true, completion: nil)
        }
        else {
            myAlert(_title: "Camera inaccessable", message: "Application cannot access the camera.")
        }
    }
    
//    func imagePickerController(_picker: UIImagePickerController, didFinishPickingMediaWithInfo infor: UIImagePickerController.InfoKey : Any) {
//        <#function body#>
//    }

    
    func myAlert(_title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }


}
