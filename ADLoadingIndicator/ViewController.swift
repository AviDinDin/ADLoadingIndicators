//
//  ViewController.swift
//  ADLoadingIndicator
//
//  Created by PositiveApps on 03/08/2017.
//  Copyright © 2017 PositiveApps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var timer:Timer = Timer()
    let loading = ADLoadingIndicator()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupLoadingIndicator()
        
    }

    private func setupLoadingIndicator(){
        
        loading.delegate = self
        loading.loadingBackgroundColor = UIColor(red: 0.3, green: 0.6, blue: 0.1, alpha: 0.5)
        loading.gifName = "Gear.gif"
        loading.gifSize = CGSize(width: 50, height: 50)
        loading.UserInteraction = true
        
    }
    
    @IBAction func startTimerBtnAction(_ sender: UIButton) {
        
        loading.UserInteraction = false
        loading.gifName = "Gear.gif"
        loading.loadingBackgroundColor = UIColor(red: 0.5, green: 0.5, blue: 0.5, alpha: 0.5)
        loading.gifSize = CGSize(width: 80, height: 80)
        loading.start()
        self.timer = Timer.scheduledTimer(timeInterval: 5.0, target: self, selector: #selector(self.stopLoading), userInfo: nil, repeats: false)

    }
    @IBAction func startBtnAction(_ sender: UIButton) {
        loading.UserInteraction = true
        loading.loadingBackgroundColor = UIColor(red: 1, green: 0.2, blue: 0.2, alpha: 0.5)
        loading.gifSize = CGSize(width: 150, height: 150)
        loading.gifName = "Infinity.gif"
        loading.start()
    }
 
    @IBAction func stopBtnAction(_ sender: UIButton) {
        loading.stop()
    }
    
    func stopLoading(){
        loading.stop()
    }
    
}

