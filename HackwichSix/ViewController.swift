//
//  ViewController.swift
//  HackwichSix
//
//  Created by CM Student on 3/5/18.
//  Copyright © 2018 CM Student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    
    
    var currentValue: Int = 0
    
    var targetValue: Int = 0
    
    @IBOutlet weak var targetLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
    
    currentValue = lroundf(slider.value)
    startNewRound()
        
    }

    func updateTargetLabel(){
        targetLabel.text = String(targetValue)
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    @IBAction func sliderHasMoved(_ sender: Any) {
    
    
        print("The value of the slider is:\(slider.value)")
    
    currentValue = lroundf(slider.value)
    
    }
    
    func startNewRound() {
      targetValue = 1 + Int(arc4random_uniform(100))
      currentValue = 50
      slider.value = Float(currentValue)
        updateTargetLabel()
    }
    
    
    
    @IBAction func myGuessButtonPressed(_ sender: Any) {
        
        let message = "The value is: \(currentValue)" + "\nThe target value is: \(targetValue)"
        
        let alert = UIAlertController(title:"Hello World!", message: message, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Awesome", style: .default, handler: nil)
        
        alert.addAction(action)
        
        present(alert, animated: true, completion:nil)
        
        startNewRound()
    }
    
}

