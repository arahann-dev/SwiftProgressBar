//
//  ViewController.swift
//  SwiftProgressBar
//
//  Created by arahann.asa@gmail.com on 09/11/2019.
//  Copyright (c) 2019 arahann.asa@gmail.com. All rights reserved.
//

import UIKit
import SwiftProgressBar

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        SwiftProgressBar.addCircularProgressBar(view: self.view, type: 1)
        SwiftProgressBar.setTrackColor(color: UIColor.black)
        SwiftProgressBar.setProgress(progress: 0.3)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

