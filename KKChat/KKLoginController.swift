//
//  KKLoginController.swift
//  KKChat
//
//  Created by jensen on 15/8/7.
//  Copyright (c) 2015年 KellenYang. All rights reserved.
//

import UIKit

extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
           return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = (newValue > 0)
        }
    }
}

class KKLoginController: UIViewController, KKAnimatedImagesViewDelegate {

    
    @IBOutlet weak var wallpaperImageView: KKAnimatedImagesView!
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.hidden = true
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        self.wallpaperImageView.delegate = self;
        self.wallpaperImageView.startAnimating()
    }
    
    func animatedImagesNumberOfImages(animatedImagesView: KKAnimatedImagesView!) -> UInt {
        return 2
    }
    
    func animatedImagesView(animatedImagesView: KKAnimatedImagesView!, imageAtIndex index: UInt) -> UIImage! {
        return UIImage(named: "\(index + 1)")
    }
    
//    func animatedImagesNumberOfImages(animatedImagesView: JSAnimatedImagesView!) -> UInt {
//        return 2
//    }
//    
//    func animatedImagesView(animatedImagesView: JSAnimatedImagesView!, imageAtIndex index: UInt) -> UIImage! {
//        return UIImage(named: "\(index + 1)")
//    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
