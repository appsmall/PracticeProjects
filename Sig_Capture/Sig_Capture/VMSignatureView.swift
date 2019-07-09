//
//  VMSignatureView.swift
//  VMSignatureViewExample
//
//  Created by Vaibhav Misra on 17/05/17.
//  Copyright © 2017 Vaibhav Misra. All rights reserved.
//

import UIKit

public protocol VMSignatureDelegate: NSObjectProtocol {
    func startedDrawing()
    func finishedDrawing()
}

class VMSignatureView: UIView {

    // MARK: - Public properties
    public weak var delegate: VMSignatureDelegate?
    
    @IBInspectable public var strokeWidth: CGFloat = 2.0 {
        didSet {
            self.path.lineWidth = strokeWidth
        }
    }
    
    @IBInspectable public var strokeColor: UIColor = .black {
        didSet {
            self.strokeColor.setStroke()
        }
    }
    
    public var hasSignature = false
    
    // MARK: - Private properties
    private var path = UIBezierPath()
    private var incrementalImage: UIImage?
    private var points =  [CGPoint](repeating: CGPoint.zero, count: 4)
    private var ptsCountAfterFirstTouch = 0
    
    // MARK: - Init
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.isMultipleTouchEnabled = false
        self.path.lineWidth = self.strokeWidth
        self.path.lineJoinStyle = CGLineJoin.round
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        self.isMultipleTouchEnabled = false
        self.path.lineWidth = self.strokeWidth
        self.path.lineJoinStyle = CGLineJoin.round
    }
    
    // MARK: - Draw
    override public func draw(_ rect: CGRect) {
        self.incrementalImage?.draw(in: rect)
        self.strokeColor.setStroke()
        self.path.stroke()
    }
    
    //MARK: - Touches methods
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.ptsCountAfterFirstTouch = 0
        if let touch: UITouch = touches.first {
            self.points[self.ptsCountAfterFirstTouch] = touch.location(in: self)
        }
        
        self.delegate?.startedDrawing()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let touch: UITouch = touches.first {
            let point = touch.location(in: self)
            self.ptsCountAfterFirstTouch += 1
            self.points[self.ptsCountAfterFirstTouch] = point
            if self.ptsCountAfterFirstTouch == 3 {
                //Take 3rd pt as average of 2nd and 4th pt
                let curveEndPointX = (self.points[1].x + self.points[3].x)/2
                let curveEndPointY = (self.points[1].y + self.points[3].y)/2
                self.points[2] = CGPoint(x: curveEndPointX,
                                         y: curveEndPointY)
                //Draw a curve from 1st to 3rd pt with 2nd pt as control pt
                self.path.move(to: self.points[0])
                self.path.addQuadCurve(to: self.points[2],
                                       controlPoint: self.points[1])
                self.setNeedsDisplay()
                //Make 3rd pt as 1st pt and 4th pt as 2nd pt for next curve
                self.points[0] = self.points[2]
                self.points[1] = self.points[3]
                self.ptsCountAfterFirstTouch = 1
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if self.ptsCountAfterFirstTouch == 0 { // Draw point for single tap
            self.path.addArc(withCenter: self.points[0],
                             radius: self.strokeWidth/2,
                             startAngle: 0,
                             endAngle: CGFloat(Double.pi * 2),
                             clockwise: true)
        }
        else if self.ptsCountAfterFirstTouch == 1 { //Draw a line in case of only 2 pts
            self.path.move(to: self.points[0])
            self.path.addLine(to: self.points[1])
        }
        else if self.ptsCountAfterFirstTouch == 2 { //Draw a quadratic curve incase of 3 pts
            self.path.move(to: self.points[0])
            self.path.addQuadCurve(to: self.points[2],
                                   controlPoint: self.points[1])
        }
        self.drawBitmap()
        self.setNeedsDisplay()
        self.path.removeAllPoints()
        self.ptsCountAfterFirstTouch = 0
        
        self.hasSignature = true
        self.delegate?.finishedDrawing()
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.touchesEnded(touches, with: event)
    }
    
    //MARK: - Helper methods
    private func drawBitmap() {
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, 0)
        self.strokeColor.setStroke()
        if self.incrementalImage == nil {
            let rectPath = UIBezierPath(rect: self.bounds)
            UIColor.white.setFill()
            
            rectPath.fill()
        }
        self.incrementalImage?.draw(at: CGPoint.zero)
        path.stroke()
        self.incrementalImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    // MARK: - Methods for interacting with Signature View
    
    // Clear the Signature View
    public func clear() {
        self.path.removeAllPoints()
        self.incrementalImage = nil
        self.hasSignature = false
        self.setNeedsDisplay()
    }
    
    // Save the Signature as an UIImage
    public func getSignature(scale:CGFloat = 0) -> UIImage? {
        if !self.hasSignature { return nil }
        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, scale)
        self.incrementalImage?.draw(at: CGPoint.zero)
        let signature = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return signature
    }
    
}
