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
    @IBOutlet weak var readView: UIImageView!
    
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
    
    func imagePickerController(_picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let mediaType = info[UIImagePickerController.InfoKey.mediaType] as! NSString
        
        
        if mediaType.isEqual(to: kUTTypeImage as NSString as String) {
            captureImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
            
            
            if flagImgaveSave {
                UIImageWriteToSavedPhotosAlbum(captureImage, self, nil, nil)
            }
            
            readView.image = captureImage
        }
//        else if mediaType.isEqual(to: kUTTypeMovie as NSString as String) {
//            if flagImgaveSave {
//                UIImageWriteToSavedPhotosAlbum(captureImage, self, nil, nil)
//            }
//        }
//
        
        self.dismiss(animated: true, completion: nil)
    }

    
    func myAlert(_title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        let action = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
    }


}
