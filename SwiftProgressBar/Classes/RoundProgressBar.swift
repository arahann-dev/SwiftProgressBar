//
//  RoundProgressBar.swift
//  Round Progress Bar
//
//  Created by Amanjot Singh Arora on 29/08/19.
//  Copyright © 2019 Amanjot Singh Arora. All rights reserved.
//

import Foundation
import UIKit

public class RoundProgressBar{
    
    static let trackLayer = CAShapeLayer()
    static let coveringLayer = CAShapeLayer()
    static var progressView = UIView()
    static var view : UIView?
    static var mainViewColor : UIColor?
    
    private init(){}
    
    public static func addRoundProgressBar(view: UIView){
        self.view = view
        self.mainViewColor = view.backgroundColor
        if #available(iOS 10.0, *) {
            self.view!.backgroundColor = UIColor(displayP3Red: 235 / 255, green: 235 / 255, blue: 235 / 255, alpha: 0.8)
        } else {
            // Fallback on earlier versions
        }
        progressView = UIView(frame: CGRect(x: view.frame.width / 2 - 100, y: view.frame.height / 2 - 64, width: 200, height: 128))
        progressView.layer.cornerRadius = 5
        progressView.alpha = 0.8
        progressView.backgroundColor = UIColor.black
        let path = UIBezierPath(arcCenter: CGPoint(x: progressView.frame.width / 2, y: progressView.frame.height / 2) , radius: 40, startAngle: -CGFloat.pi / 2, endAngle: (CGFloat.pi * 2) - (CGFloat.pi / 2), clockwise: true)
        let tPath = UIBezierPath(arcCenter: CGPoint(x: progressView.frame.width / 2, y: progressView.frame.height / 2) , radius: 20, startAngle: -CGFloat.pi / 2, endAngle: (CGFloat.pi * 2) - (CGFloat.pi / 2), clockwise: true)
        self.trackLayer.path = path.cgPath
        self.trackLayer.fillColor = UIColor.clear.cgColor
        self.trackLayer.strokeEnd = 1
        self.trackLayer.strokeColor = UIColor.red.cgColor
        self.trackLayer.lineWidth = 1
        self.coveringLayer.path = tPath.cgPath
        self.coveringLayer.fillColor = UIColor.clear.cgColor
        self.coveringLayer.strokeColor = UIColor.white.cgColor
        self.coveringLayer.lineWidth = 40
        self.coveringLayer.strokeEnd = 0
//        self.coveringLayer.lineCap = .butt
        progressView.layer.addSublayer(self.trackLayer)
        progressView.layer.addSublayer(self.coveringLayer)
        self.view!.addSubview(progressView)
    }
    
    public static func setProgress(progress: Float){
        self.coveringLayer.strokeEnd = CGFloat(progress)
    }
    
    public static func hideProgressBar(){
        self.trackLayer.removeFromSuperlayer()
        self.coveringLayer.removeFromSuperlayer()
        self.progressView.removeFromSuperview()
        self.view?.backgroundColor = self.mainViewColor
    }
    
    public static func setTrackColor(color: UIColor){
        self.trackLayer.strokeColor = color.cgColor
    }
    
    public static func setProgressColor(color: UIColor){
        self.coveringLayer.strokeColor = color.cgColor
    }
    
    public static func setProgressBackgroundColor(color: UIColor){
        self.progressView.backgroundColor = color
    }
}
