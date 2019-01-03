//
//  ViewController.swift
//  Calculator
//
//  Created by Admin on 1/2/19.
//  Copyright © 2019 Admin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblTextLabel: UILabel!
    var oldString: String?
    var newString: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func btnNumber(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            if lblTextLabel.text == "0" {
                return
            } else {
                lblTextLabel.text = lblTextLabel.text! + "0"
            }
        case 1:
            if lblTextLabel.text == "0" {
                lblTextLabel.text = ""
                lblTextLabel.text = lblTextLabel.text! + "1"
            } else {
                lblTextLabel.text = lblTextLabel.text! + "1"
            }
        case 2:
            lblTextLabel.text = lblTextLabel.text! + "2"
        case 3:
            lblTextLabel.text = lblTextLabel.text! + "3"
        case 4:
            lblTextLabel.text = lblTextLabel.text! + "4"
        case 5:
            lblTextLabel.text = lblTextLabel.text! + "5"
        case 6:
            lblTextLabel.text = lblTextLabel.text! + "6"
        case 7:
            lblTextLabel.text = lblTextLabel.text! + "7"
        case 8:
            lblTextLabel.text = lblTextLabel.text! + "8"
        case 9:
            lblTextLabel.text = lblTextLabel.text! + "9"
        case 10:
            print("10")
        case 11:
            lblTextLabel.text = lblTextLabel.text! + "."
        case 12:
            //=
        case 13:
            // +
            oldString = lblTextLabel.text
            lblTextLabel.text = ""
        case 14:
            lblTextLabel.text = lblTextLabel.text! + "2"
        case 15:
            lblTextLabel.text = lblTextLabel.text! + "2"
        case 16:
            lblTextLabel.text = lblTextLabel.text! + "2"
        case 17:
            lblTextLabel.text = lblTextLabel.text! + "2"
        case 18:
            lblTextLabel.text = lblTextLabel.text! + "2"
        case 19:
            lblTextLabel.text = lblTextLabel.text! + "2"
        default:
            print("Ko tim thay tag nao phu hop")
        }
    }
    
}

