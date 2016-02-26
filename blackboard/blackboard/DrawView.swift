//
//  DrawView.swift
//  blackboard
//
//  Created by jyb on 16/2/25.
//  Copyright © 2016年 jyb. All rights reserved.
//

import UIKit

class DrawView: UIView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    // 记录所有点
    var allPointAray = [[CGPoint]]()
    // 记录当前按下去移动时的所有点
    var subPointAray = [CGPoint]()
    
    func 清除所有(){
        allPointAray.removeAll()
        setNeedsDisplay()
    }
    
    func 撤销一步(){
        subPointAray.removeAll()
        if(allPointAray.count > 0){
            allPointAray.removeLast()
        }
        setNeedsDisplay()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("touchesBegan")
        let touchesArr = event?.allTouches()
        if let touch1 = touchesArr?.first {
            let point1 = touch1.locationInView(touch1.view)
            subPointAray.removeAll()
            subPointAray.append(point1)
            allPointAray.append(subPointAray)
        }
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("touchesMoved")
        let touchesArr = event?.allTouches()
        if let touch1 = touchesArr?.first {
            let point = touch1.locationInView(touch1.view)
            allPointAray.removeLast()
            subPointAray.append(point)
            allPointAray.append(subPointAray)
            setNeedsDisplay()
        }
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("touchesEnded")
        let touchesArr = event?.allTouches()
        if let touch1 = touchesArr?.first {
            let point = touch1.locationInView(touch1.view)
            allPointAray.removeLast()
            subPointAray.append(point)
            allPointAray.append(subPointAray)
            setNeedsDisplay()
        }
    }
    
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
        let context = UIGraphicsGetCurrentContext()
        CGContextSetStrokeColorWithColor(context, UIColor.blackColor().CGColor)//线颜色
        CGContextSetLineWidth(context, 5)
        CGContextSetLineCap(context, CGLineCap.Round)
        for sub in allPointAray{
            CGContextAddLines(context, sub, sub.count)
        }
        CGContextStrokePath(context)
    }
    
}
