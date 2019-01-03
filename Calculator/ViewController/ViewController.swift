import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblTextLabel: UILabel!
    var oldString: String?
    var newString: String?
    var flag = false
    var flag2 = false
    var phepTinh: String?
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    enum Calculation {
        case cong
        case tru
        case nhan
        case chia
        case chiaPhanTram
    }
    
    func calculate(phepTinh: Calculation) {
        switch phepTinh {
        case .cong:
            newString = lblTextLabel.text
            if flag2 {
                let result: Double = Double(oldString!)! + Double(newString!)!
                lblTextLabel.text = String(result)
                flag2 = false
            } else {
                let result: Int = Int(oldString!)! + Int(newString!)!
                lblTextLabel.text = String(result)
            }
        case .tru:
            newString = lblTextLabel.text
            if flag2 {
                let result: Double = Double(oldString!)! - Double(newString!)!
                lblTextLabel.text = String(result)
                flag2 = false
            } else {
                let result: Int = Int(oldString!)! - Int(newString!)!
                lblTextLabel.text = String(result)
            }
        case .nhan:
            newString = lblTextLabel.text
            if flag2 {
                let result: Double = Double(oldString!)! * Double(newString!)!
                lblTextLabel.text = String(result)
                flag2 = false
            } else {
                let result: Int = Int(oldString!)! * Int(newString!)!
                lblTextLabel.text = String(result)
            }
        case .chia:
            newString = lblTextLabel.text
            let result: Double = Double(oldString!)! / Double(newString!)!
            lblTextLabel.text = String(result)
        case .chiaPhanTram:
            let result: Double = Double(oldString!)! / 100
            lblTextLabel.text = String(result)
        }
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
            if flag {
                lblTextLabel.text = ""
                flag = false
            }
            
            if lblTextLabel.text == "0" {
                lblTextLabel.text = ""
                lblTextLabel.text = lblTextLabel.text! + "1"
            } else {
                lblTextLabel.text = lblTextLabel.text! + "1"
            }
        case 2:
            if flag {
                lblTextLabel.text = ""
                flag = false
            }
            
            if lblTextLabel.text == "0" {
                lblTextLabel.text = ""
                lblTextLabel.text = lblTextLabel.text! + "2"
            } else {
                lblTextLabel.text = lblTextLabel.text! + "2"
            }
        case 3:
            if flag {
                lblTextLabel.text = ""
                flag = false
            }
            
            if lblTextLabel.text == "0" {
                lblTextLabel.text = ""
                lblTextLabel.text = lblTextLabel.text! + "3"
            } else {
                lblTextLabel.text = lblTextLabel.text! + "3"
            }
        case 4:
            if flag {
                lblTextLabel.text = ""
                flag = false
            }
            
            if lblTextLabel.text == "0" {
                lblTextLabel.text = ""
                lblTextLabel.text = lblTextLabel.text! + "4"
            } else {
                lblTextLabel.text = lblTextLabel.text! + "4"
            }
        case 5:
            if flag {
                lblTextLabel.text = ""
                flag = false
            }
            
            if lblTextLabel.text == "0" {
                lblTextLabel.text = ""
                lblTextLabel.text = lblTextLabel.text! + "5"
            } else {
                lblTextLabel.text = lblTextLabel.text! + "5"
            }
        case 6:
            if flag {
                lblTextLabel.text = ""
                flag = false
            }
            
            if lblTextLabel.text == "0" {
                lblTextLabel.text = ""
                lblTextLabel.text = lblTextLabel.text! + "6"
            } else {
                lblTextLabel.text = lblTextLabel.text! + "6"
            }
        case 7:
            if flag {
                lblTextLabel.text = ""
                flag = false
            }
            
            if lblTextLabel.text == "0" {
                lblTextLabel.text = ""
                lblTextLabel.text = lblTextLabel.text! + "7"
            } else {
                lblTextLabel.text = lblTextLabel.text! + "7"
            }
        case 8:
            if flag {
                lblTextLabel.text = ""
                flag = false
            }
            
            if lblTextLabel.text == "0" {
                lblTextLabel.text = ""
                lblTextLabel.text = lblTextLabel.text! + "8"
            } else {
                lblTextLabel.text = lblTextLabel.text! + "8"
            }
        case 9:
            if flag {
                lblTextLabel.text = ""
                flag = false
            }
            
            if lblTextLabel.text == "0" {
                lblTextLabel.text = ""
                lblTextLabel.text = lblTextLabel.text! + "9"
            } else {
                lblTextLabel.text = lblTextLabel.text! + "9"
            }
        case 11:
            if flag {
                lblTextLabel.text = ""
                flag = false
            }
            lblTextLabel.text = lblTextLabel.text! + "."
            flag2 = true
        case 12:
            switch phepTinh {
                case "+":
                    calculate(phepTinh: ViewController.Calculation.cong)
                case "-":
                    calculate(phepTinh: ViewController.Calculation.tru)
                case "*":
                    calculate(phepTinh: ViewController.Calculation.nhan)
                case "/":
                    calculate(phepTinh: ViewController.Calculation.chia)
                default:
                    print("Khong co phep tinh nao")
            }
        case 13:
            flag = true
            phepTinh = "+"
            oldString = lblTextLabel.text
        case 14:
            flag = true
            phepTinh = "-"
            oldString = lblTextLabel.text
        case 15:
            flag = true
            phepTinh = "*"
            oldString = lblTextLabel.text
        case 16:
            flag = true
            phepTinh = "/"
            oldString = lblTextLabel.text
        case 17: 
            flag = true
            phepTinh = "%"
            oldString = lblTextLabel.text
            calculate(phepTinh: ViewController.Calculation.chiaPhanTram)
        case 18:
            lblTextLabel.text = lblTextLabel.text! + "2"
        case 19:
            lblTextLabel.text = "0"
        default:
            print("Ko tim thay tag nao phu hop")
        }
    }
    
}

