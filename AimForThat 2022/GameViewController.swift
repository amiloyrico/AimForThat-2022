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
        
        
    setupSlider()
        
    resetGame()
    updateLabels()
}

    func setupSlider(){
        let thumbImageNormal = UIImage (named: "SliderThumb-Normal")
        let thumbImageHiglighted = UIImage (named: "SliderThumb-Highlighted")
        let trackLetftImage = UIImage(named: "SliderTrackLeft")
        let trackRightImage = UIImage (named: "SliderTrackRight")
        
        self.slider.setThumbImage(thumbImageNormal, for: .normal)
        self.slider.setThumbImage(thumbImageHiglighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftResizable = trackLetftImage?.resizableImage(withCapInsets: insets)
        let trackRightResizable = trackRightImage?.resizableImage(withCapInsets:insets)
        
        self.slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        self.slider.setMaximumTrackImage(trackRightResizable, for: .normal)
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
        
        let message = "Has marcado \(points) puntos"
        
        self.score += points
        
        
        let alert = UIAlertController (title: title, message: message, preferredStyle: .alert)
        
        
        
        let action = UIAlertAction(title: "OK!", style: .default, handler:
        {action in
            self.starNewRoud()
            
            self.updateLabels()
            
    
           
        } )
        
//
        alert.addAction(action)

        present(alert, animated: true)
        
        
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
    @IBAction func starNewGame (){
        resetGame()
        updateLabels()
        
    }
    func resetGame (){
        self.score = 0
        self.round = 0
        self.starNewRoud()
    }
    
}


 
