//
//  ViewController.swift
//  BezierMagic
//
//  Created by Christian Iñigo De Leon Alvarez on 6/12/20.
//  Copyright © 2020 Christian Iñigo De Leon Alvarez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var labelOne: UILabel!
    
    @IBOutlet weak var labelDos: UILabel! {
        didSet {
            labelDos.curvedBottomRightMask()
        }
    }
    
    @IBOutlet weak var labelTatlo: UILabel! {
        didSet {
            labelTatlo.cylinderMask()
        }
    }
    
    @IBOutlet weak var label5: UILabel! {
        didSet {
            label5.curvedBottomLeftMask()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

