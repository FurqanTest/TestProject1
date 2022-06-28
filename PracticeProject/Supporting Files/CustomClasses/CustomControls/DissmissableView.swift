//
//  DissmissableView.swift
//  pickVault
//
//  Created by Furqan Ali Khan on 08/07/2020.
//  Copyright © 2020 Furqan Ali Khan. All rights reserved.
//

import UIKit
class DissmissableView: UIView {
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    var topWindow:UIWindow?
    var dismissButton:UIButton?
    var isShowing:Bool = false
    var shouldAllowTapToDismiss:Bool?
    var tempViewController:UIViewController?
    var isCenterOriented:Bool = false
    
    
    
    func Show()
    {
        if isShowing
        {
            return
        }
        
        let width:CGFloat = UIScreen.main.bounds.width
        let height:CGFloat = UIScreen.main.bounds.height
        
        self.bounds = CGRect.init(x: 0, y: 0, width: width, height: height)
        
        let uIWindow:UIWindow = UIWindow.init(frame: CGRect.init(x: 0, y: 0, width: width, height: height))
        topWindow = uIWindow
        topWindow?.backgroundColor = UIColor.clear
        topWindow?.windowLevel = UIWindow.Level.alert + 2 // priority
        
        
        tempViewController = UIViewController.init()
        tempViewController?.view.backgroundColor = UIColor.clear
        
        
        if shouldAllowTapToDismiss == true
        {
            dismissButton = UIButton.init(type: UIButton.ButtonType.custom)
            dismissButton?.autoresizingMask = UIView.AutoresizingMask(rawValue: UIView.AutoresizingMask.flexibleWidth.rawValue)
            dismissButton?.autoresizingMask = UIView.AutoresizingMask(rawValue: UIView.AutoresizingMask.flexibleHeight.rawValue)
            dismissButton?.translatesAutoresizingMaskIntoConstraints = true
            dismissButton?.frame = (tempViewController?.view.bounds)!
            
            dismissButton?.addTarget(self, action: #selector(self.dismissButtonTap(_:)), for: UIControl.Event.touchUpInside)
            
            tempViewController?.view.addSubview(dismissButton!)
        }
        
        topWindow?.rootViewController = tempViewController
        topWindow?.makeKeyAndVisible()
        topWindow?.isHidden = false
        
        tempViewController?.view.addSubview(self)
        self.translatesAutoresizingMaskIntoConstraints = true
        
        
        
        
        
        let viewWidth:CGFloat = WidthForView()
        let viewHeight:CGFloat = HightForView()
        var viewX:CGFloat = 0
        if viewWidth < width
        {
            viewX = (width / 2) - (viewWidth / 2)
        }
        self.frame = CGRect.init(x: viewX, y: height, width: viewWidth, height: viewHeight)
        
        if isCenterOriented == true
        {
            self.frame = CGRect.init(x: viewX, y: (height / 2) -  (viewHeight / 2), width: viewWidth, height: viewHeight)
            self.alpha = 0.0
        }
        
        UIView.animate(withDuration: 0.35, animations: {
            self.AnimationStart()
        }) { _ in
            self.AnimationEnd()
        }
        
        
    }
    
    func AnimationStart()
    {
        
        let width:CGFloat  = UIScreen.main.bounds.width
        let height:CGFloat  = UIScreen.main.bounds.height
        let viewWidth:CGFloat = WidthForView()
        let viewHeight:CGFloat = HightForView()
        
        var viewX:CGFloat = 0
        if viewWidth < width
        {
            viewX = (width / 2) - (viewWidth / 2)
        }
        self.frame = CGRect.init(x: viewX, y: height, width: viewWidth, height: viewHeight)
        
        if isCenterOriented == true
        {
            
            self.alpha = 1.0
        }
        else
        {
            self.frame = CGRect.init(x: viewX, y: height - viewHeight, width: viewWidth, height: viewHeight)
        }
        
        tempViewController?.view.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: self.BlackOverlayAlpha())
    }
    
    
    func Hide()
    {
        
        UIView.animate(withDuration: 0.35, animations: {
            self.EndAnimationStart()
        }) { _ in
            self.EndAnimationEnd()
        }
        //        UIView.animate(withDuration: 0.35, animations: EndAnimationStart, completion: nil)
    }
    
    func AnimationEnd()
    {
        isShowing = true
        //        return true
        
    }
    
    func EndAnimationStart()
    {
        
        let width:CGFloat  = UIScreen.main.bounds.width
        let height:CGFloat  = UIScreen.main.bounds.height
        let viewWidth:CGFloat = WidthForView()
        let viewHeight:CGFloat = HightForView()
        
        var viewX:CGFloat = 0
        if viewWidth < width
        {
            viewX = (width / 2) - (viewWidth / 2)
        }
        self.frame = CGRect.init(x: viewX, y: height, width: viewWidth, height: viewHeight)
        
        if isCenterOriented == true
        {
            
            self.alpha = 0.0
        }
        else
        {
            self.frame = CGRect.init(x: viewX, y: height, width: viewWidth, height: viewHeight)
        }
        
        tempViewController?.view.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0)
    }
    
    func EndAnimationEnd()
    {
        isShowing = true
        self.removeFromSuperview()
        self.isShowing = false
        self.topWindow?.isHidden = true
        self.topWindow = nil
        
        //            hideCalled?.invoke(nil,nil)
    }
    
    
    @objc func dismissButtonTap(_ sender: UITapGestureRecognizer? = nil) {
        Hide()
    }
    
    func ViewToRepresent() -> UIView
    {
        return UIView.init()
    }
    
     public func HightForView() -> CGFloat
    {
        return 255
    }
    
    public func WidthForView() -> CGFloat
    {
        return UIScreen.main.bounds.width
    }
    
    public func BlackOverlayAlpha() -> CGFloat
    {
        return 0
    }
    
    
}
