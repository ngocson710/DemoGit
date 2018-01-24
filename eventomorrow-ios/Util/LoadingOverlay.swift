//
//  LoadingOverlay.swift
//  DemoMVP
//
//  Created by Pham Nguyen Nhat Anh on 1/15/18.
//  Copyright © 2018 Nguyen Ngoc Son. All rights reserved.
//
import UIKit
public class LoadingOverlay{
    var overlayView = UIView()
    var activityIndicator = UIActivityIndicatorView()
    
    class var shared: LoadingOverlay{
        struct Static{
            static let instance: LoadingOverlay = LoadingOverlay()
        }
        return Static.instance
    }
    
    public func show(view: UIView){
        overlayView.frame = CGRect(x:0, y:0, width: 40, height: 40)
        overlayView.center = view.center
        overlayView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        overlayView.clipsToBounds = true
        overlayView.layer.cornerRadius = 10
        
        activityIndicator.frame = CGRect(x:0, y:0, width: 40, height: 40)
        activityIndicator.activityIndicatorViewStyle = .white
        activityIndicator.center = CGPoint(x: overlayView.bounds.width/2, y: overlayView.bounds.height/2)
        
        overlayView.addSubview(activityIndicator)
        view.addSubview(overlayView)
        
        activityIndicator.startAnimating()
    }
    
    public func hide(){
        activityIndicator.stopAnimating()
        overlayView.removeFromSuperview()
    }
    
}
