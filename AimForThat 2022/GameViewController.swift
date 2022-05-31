//
//  ViewController.swift
//  AimForThat 2022
//
//  Created by Alba Yolima Rico Montenegro on 17/05/22.
//

import UIKit

class GameViewController: UIViewController {

    // MARK: - VARIABLES
    var currentValue : Int = 0
    var targetValue  : Int = 0
    var score        : Int = 0
    var round        : Int = 0
    
    @IBOutlet weak var slider: UISlider!
    
    
    
    @IBOutlet weak var targetLabel: UILabel!
    
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    
    @IBOutlet weak var roundLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    starNewRoud()
    updateLabels()
        
        
    }

    
    @IBAction func showAlert() {
        
        /*var difference : Int = 0
        
        if self.currentValue > self.targetValue {
            difference = self.currentValue - self.targetValue
        } else {
            difference = self.targetValue - self.currentValue
        }*/
        
        /*var difference: Int = self.currentValue - self.targetValue
        if difference < 0 {
            difference *= -1
        }*/
        
        let difference : Int = abs(self.currentValue - self.targetValue)
        
        var points = 100 - difference
        
       
        
        let message = """
            Has marcado \(points) puntos
         """
        let title: String
        
        switch difference {
        case 0:
            title = "¡¡¡Puntuación perfecta!!!"
            points = Int(10.0 * Float(points))
        case 1...5:
            title = "Casi perfecto!"
            points = Int(1.5 * Float(points))
        case 6...12:
            title = "Te ha faltado poco!"
            points = Int(1.2 * Float(points))
        default:
            title = "Has ido lejos... "
        }
        
        self.score += points
        
        
        let alert = UIAlertController (title: title, message: message, preferredStyle: .alert)
        
        
        
        let action = UIAlertAction(title: "Genial!", style: .default, handler: nil )
        
//
        alert.addAction(action)

        present(alert, animated: true)
        
        starNewRoud()
        updateLabels()
        
    }
    
    
    @IBAction func sliderMoved(_ sender: UISlider) {
        self.currentValue = lroundf(sender.value)
    }
    
    func starNewRoud () {
        self.targetValue = 1 + Int(arc4random_uniform(100))
        self.currentValue = 50
        self.slider.value = Float(self.currentValue)
        self.round += 1
       
    }
    
    
    func updateLabels (){
        self.targetLabel.text = "\(self.targetValue)"
        self.scoreLabel.text = "\(self.score)"
        self.roundLabel.text = "\(self.round)"
    }
}

 
