//
//  ViewController.swift
//  CustomControls
//
//  Created by Jonathan T. Miles on 8/28/18.
//  Copyright © 2018 Jonathan T. Miles. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func updateRating(_ sender: CustomControl) {
        if sender.value > 1 {
            self.title = "User Rating: \(sender.value) stars"
        } else {
            self.title = "User Rating: \(sender.value) star"
        }
    }
    
}

