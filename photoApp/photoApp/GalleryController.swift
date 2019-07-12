//
//  ViewController.swift
//  photoApp
//
//  Created by GWC on 7/12/19.
//  Copyright © 2019 GWC. All rights reserved.
//

import UIKit

class GalleryController: UIViewController {
    @IBOutlet weak var galleryImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getImage(imageName: "test.png")
        // Do any additional setup after loading the view.
    }
    func getImage (imageName: String){
        let fileManager = FileManager.default
        let imagePath = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask,true)[0] as NSString).appendingPathComponent(imageName)
        if fileManager.fileExists(atPath: imagePath) {
            //galleryImageView.image = UIImage(contentsOfFile: imagePath)
            let image = UIImage(contentsOfFile: imagePath)
            let newImage = UIImage(cgImage: (image?.cgImage!)!, scale: (image?.scale)!,orientation: .right)
            galleryImageView.image = newImage
        } else {
            print("Oh no! No Image!")
        }    }
    
}

