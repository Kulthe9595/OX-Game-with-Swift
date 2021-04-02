//
//  ViewController.swift
//  OXGame
//
//  Created by Shubham Kulthe on 28/06/20.
//  Copyright © 2020 Shubham Kulthe. All rights reserved.
//

import UIKit

public var pOrC = 0 // 1->PvC 2->PvP
class ViewController: UIViewController {

    
    override func viewDidLoad() {
           super.viewDidLoad()
           // Do any additional setup after loading the view.
       }

    
    
    @IBAction func playerVSComputerButtonPressed(_ sender: Any) {
        pOrC = 1
        performSegue(withIdentifier: "playTheGame", sender: self)
    }
   
    @IBAction func playerVSFriend(_ sender: Any) {
        pOrC = 2
        performSegue(withIdentifier: "playTheGame", sender: self)
    }
    
}

