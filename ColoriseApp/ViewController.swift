//
//  ViewController.swift
//  ColoriseApp
//
//  Created by user on 25.09.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet var sliders: [UISlider]!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        colorView.layer.cornerRadius = 20
    }

    @IBAction func changeColor() {
        for slider in sliders {
            switch slider.tag {
            case 1:
                redLabel.text = updateToString(slider.value)
            case 2:
                greenLabel.text = updateToString(slider.value)
            default:
                blueLabel.text = updateToString(slider.value)
            }
        }
        changeViewColor()
    }
    
    private func changeViewColor() {
        guard let redValue = Double(redLabel.text ?? ""),
              let greenValue = Double(greenLabel.text ?? ""),
              let blueValue = Double(blueLabel.text ?? "")
                else
        { return }
        colorView.backgroundColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1)
    }
    
    private func updateToString(_ value: Float) -> String {
        String(format: "%.2f", value)
    }
}

