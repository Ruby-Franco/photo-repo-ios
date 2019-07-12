//
//  PhotoController.swift
//  photoApp
//
//  Created by GWC on 7/12/19.
//  Copyright © 2019 GWC. All rights reserved.
//

import UIKit

import CoreImage

class PhotoController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var mainImage: UIImageView!
    
    @IBAction func sepiaFilter(_ sender: Any) {
        let context = CIContext()
        let filter = CIFilter(name: "CISepiaTone")!
        filter.setValue(0.8, forKey: kCIInputIntensityKey)
        let image = CIImage(image: mainImage.image!)
        filter.setValue(image, forKey: kCIInputImageKey)
        let result = filter.outputImage!
        let cgImage = context.createCGImage(result, from: result.extent)
        let filteredImage = UIImage(cgImage: cgImage!)
        let newImage = UIImage(cgImage: (filteredImage.cgImage!), scale: (filteredImage.scale),orientation: .right)
        mainImage.image = newImage
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func takePhoto(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .camera
        imagePickerController.delegate=self
        present(imagePickerController , animated: true, completion: nil)
        
    }
    
    @IBAction func savePicture(_ sender: Any) {
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info:[UIImagePickerController.InfoKey : Any]){
        
        picker.dismiss(animated: true, completion:nil)
        mainImage.image = info [UIImagePickerController.InfoKey.originalImage] as? UIImage 
    }
    // MARK: - Table view data source

    @IBAction func savePhoto(_ sender: Any) {
        saveImage(imageName: "test.png")
    }
    func saveImage(imageName:String ) {
        let fileManager = FileManager.default
        let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask,
                                                             true)[0] as NSString).appendingPathComponent(imageName)
        let image = mainImage.image!
        let imageData = image.pngData()
        fileManager.createFile(atPath: imagePath as String, contents: imageData, attributes: nil) }
    
}


