//
//  ViewController.swift
//  sampleScreenShotApp
//
//  Created by Muneharu Onoue on 2017/03/24.
//  Copyright © 2017年 Muneharu Onoue. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func takeSS(_ sender: UIButton) {
        let image = view.GetImage()
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
    }


}

extension UIView {
    func GetImage() -> UIImage{
        let rect = self.bounds
        UIGraphicsBeginImageContext(rect.size)
        guard let context = UIGraphicsGetCurrentContext() else {
            fatalError("couldn't get context")
        }
        layer.render(in: context)
        guard let capturedImage = UIGraphicsGetImageFromCurrentImageContext() else {
            fatalError("couldn't get captured image")
        }
        UIGraphicsEndImageContext()
        return capturedImage
    }
}

