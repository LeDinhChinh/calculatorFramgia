import UIKit

class ViewController: UIViewController {

    @IBOutlet weak private var textLabel: UILabel!
    private var oldNumber: String?
    private var newNumber: String?
    private var isCalculatorButtonTapped = false
    private var isFloatingPoint = false
    private var calculation: String?
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
        newNumber = textLabel.text
        guard let newNumbers = textLabel.text,
              let newNumber = Double(newNumbers),
              let oldNumbers = oldNumber,
              let oldNumber = Double(oldNumbers) else {
            fatalError("newNumber is nil")
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
            fatalError("")
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
            switch calculation {
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
            calculation = "+"
            oldNumber = textLabel.text
        case 14:
            isCalculatorButtonTapped = true
            calculation = "-"
            oldNumber = textLabel.text
        case 15:
            isCalculatorButtonTapped = true
            calculation = "*"
            oldNumber = textLabel.text
        case 16:
            isCalculatorButtonTapped = true
            calculation = "/"
            oldNumber = textLabel.text
        case 17: 
            isCalculatorButtonTapped = true
            calculation = "%"
            oldNumber = textLabel.text
            calculate(calculation: ViewController.CalculationType.percent)
        case 19:
            textLabel.text = "0"
        default:
            print("Ko tim thay tag nao phu hop")
        }
    }
}



