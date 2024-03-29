//
//  SwiftProgressBar.swift
//  Swift Progress Bar
//
//  Created by Amanjot Singh Arora on 29/08/19.
//  Copyright © 2019 Amanjot Singh Arora. All rights reserved.
//

import Foundation
import UIKit

public class SwiftProgressBar{
    
    private static let trackLayer = CAShapeLayer()
    private static let coveringLayer = CAShapeLayer()
    private static var progressView = UIView()
    private static var view : UIView?
    private static var mainViewColor : UIColor?
    private static var progressBarType : Int = 1
    private static let CircularBorderProgressBar : Int = 1
    private static let CircularFillProgressBar : Int = 2
    
    private init(){}
    
    //MARK:- add border progress bar default
    static func addBorderCircularProgressBar(view: UIView){
        self.view = view
        self.mainViewColor = view.backgroundColor
        self.view!.backgroundColor = UIColor.lightGray
        //setting up container for porgress bar
        progressView = UIView(frame: CGRect(x: view.frame.width / 2 - 100, y: view.frame.height / 2 - 64, width: 200, height: 128))
        progressView.layer.cornerRadius = 5
        progressView.alpha = 0.8
        self.setProgressBackgroundColor(color: UIColor.white)
        //path for progress bar
        let path = UIBezierPath(arcCenter: CGPoint(x: progressView.frame.width / 2, y: progressView.frame.height / 2) , radius: 40, startAngle: -CGFloat.pi / 2, endAngle: (CGFloat.pi * 2) - (CGFloat.pi / 2), clockwise: true)
        self.trackLayer.path = path.cgPath
        self.trackLayer.fillColor = UIColor.clear.cgColor
        self.trackLayer.strokeEnd = 1
        self.setTrackWidth(width: 4)
        self.setTrackColor(color: UIColor.black)
        //setting up progress bar attributes
        self.coveringLayer.path = path.cgPath
        self.coveringLayer.fillColor = UIColor.clear.cgColor
        self.setProgressWidth(width: 4)
        self.setProgressColor(color: UIColor.lightGray)
        self.setProgress(progress: 0)
        //adding both layers to container view
        progressView.layer.addSublayer(self.trackLayer)
        progressView.layer.addSublayer(self.coveringLayer)
        //        adding container view to main view
        self.view!.addSubview(progressView)
    }
    
    //MARK:- add fill progress bar default
    static func addFillCircularProgressBar(view: UIView){
        self.view = view
        self.mainViewColor = view.backgroundColor
        self.view!.backgroundColor = UIColor.lightGray
        //setting up container for porgress bar
        progressView = UIView(frame: CGRect(x: view.frame.width / 2 - 100, y: view.frame.height / 2 - 64, width: 200, height: 128))
        progressView.layer.cornerRadius = 5
        progressView.alpha = 0.8
        self.setProgressBackgroundColor(color: UIColor.white)
        //path for progress bar
        let path = UIBezierPath(arcCenter: CGPoint(x: progressView.frame.width / 2, y: progressView.frame.height / 2) , radius: 40, startAngle: -CGFloat.pi / 2, endAngle: (CGFloat.pi * 2) - (CGFloat.pi / 2), clockwise: true)
        let tPath = UIBezierPath(arcCenter: CGPoint(x: progressView.frame.width / 2, y: progressView.frame.height / 2) , radius: 20, startAngle: -CGFloat.pi / 2, endAngle: (CGFloat.pi * 2) - (CGFloat.pi / 2), clockwise: true)
        //setting up progress track attributes
        self.trackLayer.path = path.cgPath
        self.trackLayer.fillColor = UIColor.clear.cgColor
        self.trackLayer.strokeEnd = 1
        self.setTrackWidth(width: 1)
        self.setTrackColor(color: UIColor.black)
        //setting up progress bar attributes
        self.coveringLayer.path = tPath.cgPath
        self.coveringLayer.fillColor = UIColor.clear.cgColor
        self.setProgressWidth(width: 40)
        self.setProgressColor(color: UIColor.lightGray)
        self.coveringLayer.strokeEnd = 0
        //adding both layers to container view
        progressView.layer.addSublayer(self.trackLayer)
        progressView.layer.addSublayer(self.coveringLayer)
        //        adding container view to main view
        self.view!.addSubview(progressView)
    }
    
    //MARK:- add progress bar with type parameter
    public static func addCircularProgressBar(view: UIView, type: Int){
        if type == self.CircularBorderProgressBar{
            self.addBorderCircularProgressBar(view: view)
        }else{
            self.addFillCircularProgressBar(view: view)
        }
    }
    
    //MARK:- set progress of progress bar
    public static func setProgress(progress: Float){
        self.coveringLayer.strokeEnd = CGFloat(progress)
    }
    
    //MARK:- hide progress bar
    public static func hideProgressBar(){
        self.trackLayer.removeFromSuperlayer()
        self.coveringLayer.removeFromSuperlayer()
        self.progressView.removeFromSuperview()
        self.view?.backgroundColor = self.mainViewColor
    }
    
    //MARK:- set track color
    public static func setTrackColor(color: UIColor){
        self.trackLayer.strokeColor = color.cgColor
    }
    
    //MARK:- set progress color
    public static func setProgressColor(color: UIColor){
        self.coveringLayer.strokeColor = color.cgColor
    }
    
    //MARK:- set progress background view color
    public static func setProgressBackgroundColor(color: UIColor){
        self.progressView.backgroundColor = color
    }
    
    //MARK:- set track width
    public static func setTrackWidth(width: Int){
        self.trackLayer.lineWidth = CGFloat(width)
    }
    
    //MARK:- set progress bar width
    public static func setProgressWidth(width: Int){
        self.coveringLayer.lineWidth = CGFloat(width)
    }
}
