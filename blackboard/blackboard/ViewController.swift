//
//  ViewController.swift
//  blackboard
//
//  Created by jyb on 16/2/25.
//  Copyright © 2016年 jyb. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var drawView: DrawView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //黑板颜色
        //drawView.backgroundColor = UIColor.clearColor()
        //drawView.backgroundColor = UIColor(red: 0.127, green: 0.243, blue: 0.239, alpha: 1)
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func 清除所有(sender: AnyObject) {
        drawView.清除所有()
    }

    @IBAction func 撤销一步(sender: AnyObject) {
        drawView.撤销一步()
    }

    @IBAction func 保存图片(sender: AnyObject) {
        UIGraphicsBeginImageContext(drawView.frame.size)
        if let context = UIGraphicsGetCurrentContext(){
            drawView.layer.renderInContext(context)
            UIImageWriteToSavedPhotosAlbum(UIGraphicsGetImageFromCurrentImageContext(), self, "image:didFinishSavingWithError:contextInfo:", nil)
        }
    }
    
    func image(image: UIImage, didFinishSavingWithError: NSError?, contextInfo: AnyObject) {
        if didFinishSavingWithError != nil {
            print("错误")
            return
        }
        print("保存成功")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

