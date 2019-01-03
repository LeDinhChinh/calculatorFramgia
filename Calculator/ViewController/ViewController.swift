import UIKit

class ViewController: UIViewController {

    @IBOutlet weak private var textLabel: UILabel!
    private var oldNumber = "0"
    private var currentNumber = "0"
    private var isCalculatorButtonTapped = false
    private var isFloatingPoint = false
    private var operatorr: String?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    enum CalculationType {
        case add
        case sub
        case multi
        case div
        case percent
    }
    
    func calculate(calculation: CalculationType) {
        guard let currentNumber = textLabel.text,
              let newNumber = Double(currentNumber),
              let oldNumber = Double(oldNumber) else {
            print("currentNumber or oldNumber is nil")
                return
        }
        var result: Double = 0
        switch calculation {
        case .add:
            result = oldNumber + newNumber
        case .sub:
            result = oldNumber - newNumber
        case .multi:
            result = oldNumber * newNumber
        case .div:
            result = oldNumber / newNumber
        case .percent:
            result = oldNumber / 100
            textLabel.text = String(result)
            return
        }
        
        if !isFloatingPoint {
            textLabel.text = String(Int(result))
        } else {
            textLabel.text = String(result)
            isFloatingPoint = false
        }
    }
    
    @IBAction func btnNumber(_ sender: UIButton) {
        guard var currentLabel = textLabel.text else {
            print("textLabel.text is nil")
            return
        }
        switch sender.tag {
        case 0:
            if textLabel.text == "0" {
                return
            } else {
                textLabel.text = currentLabel + "0"
            }
        case 1...9:
            if isCalculatorButtonTapped {
                textLabel.text = ""
                currentLabel = ""
                isCalculatorButtonTapped = false
            }
            
            if textLabel.text == "0" {
                textLabel.text = ""
                currentLabel = ""
                textLabel.text = currentLabel + String(sender.tag)
            } else {
                textLabel.text = currentLabel + String(sender.tag)
            }
        case 11:
            if isCalculatorButtonTapped {
                textLabel.text = ""
                isCalculatorButtonTapped = false
            }
            textLabel.text = currentLabel + "."
            isFloatingPoint = true
        case 12:
            switch operatorr {
                case "+":
                    calculate(calculation: ViewController.CalculationType.add)
                case "-":
                    calculate(calculation: ViewController.CalculationType.sub)
                case "*":
                    calculate(calculation: ViewController.CalculationType.multi)
                case "/":
                    calculate(calculation: ViewController.CalculationType.div)
                default:
                    print("Khong co phep tinh nao")
            }
        case 13:
            isCalculatorButtonTapped = true
            operatorr = "+"
            oldNumber = currentLabel
        case 14:
            isCalculatorButtonTapped = true
            operatorr = "-"
            oldNumber = currentLabel
        case 15:
            isCalculatorButtonTapped = true
            operatorr = "*"
            oldNumber = currentLabel
        case 16:
            isCalculatorButtonTapped = true
            operatorr = "/"
            oldNumber = currentLabel
        case 17: 
            isCalculatorButtonTapped = true
            operatorr = "%"
            oldNumber = currentLabel
            calculate(calculation: ViewController.CalculationType.percent)
        case 19:
            textLabel.text = "0"
        default:
            print("Ko tim thay tag nao phu hop")
        }
    }
}



