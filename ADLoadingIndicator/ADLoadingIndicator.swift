//
//  ADLoadingIndicator.swift
//  ADLoadingIndicator
//
//  Created by PositiveApps on 03/08/2017.
//  Copyright © 2017 PositiveApps. All rights reserved.
//

import UIKit

class ADLoadingIndicator: UIView {

    let gifManager = SwiftyGifManager(memoryLimit:100)
    var delegate = UIViewController()
    let gifAnimation = UIImageView()
    var background = UIView()
    
    
    public var loadingBackgroundColor : UIColor =  UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.6) {
        didSet {
            background.backgroundColor = loadingBackgroundColor
        }
    }
    
    public var gifName : String =  "Gear.gif" {
        didSet {

            gifAnimation.setGifImage(UIImage(gifName: gifName), manager: gifManager, loopCount: -1)

        }
    }
    
    public var gifSize : CGSize = CGSize(width: 100, height: 100) {
        didSet {
            gifAnimation.frame.size = gifSize
            gifAnimation.center = CGPoint(x: background.bounds.width / 2, y: background.bounds.height / 2)

        }
    }

    public var UserInteraction : Bool = true {
        didSet {
            
            delegate.view.isUserInteractionEnabled = UserInteraction

        }
    }

    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    private func setup() {
        
        background = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        
        background.tag = 100
        
        background.backgroundColor = loadingBackgroundColor
        
        gifAnimation.frame.size = gifSize

        gifAnimation.center = CGPoint(x: background.bounds.width / 2, y: background.bounds.height / 2)

        gifAnimation.setGifImage(UIImage(gifName: gifName), manager: gifManager, loopCount: -1)
        
        background.addSubview(gifAnimation)
        
    }
    
    
    func start(){
        
        background.isUserInteractionEnabled = false
        delegate.view.addSubview(background)

        
    }
    func stop(){
        
        delegate.view.isUserInteractionEnabled = true
        if let viewWithTag = delegate.view.viewWithTag(100) {
            viewWithTag.removeFromSuperview()
        }
    }
    
    
    
}
