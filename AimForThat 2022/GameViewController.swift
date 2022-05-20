//
//  ViewController.swift
//  AimForThat 2022
//
//  Created by Alba Yolima Rico Montenegro on 17/05/22.
//

import UIKit

class GameViewController: UIViewController {

    // MARK: - VARIABLES
    
 
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    
    @IBAction func showAlert() {
        
        
        let alert = UIAlertController (title: "Hola mundo", message: "Este es mi juego Aim For That!", preferredStyle: .alert)
        
        
        
        let action = UIAlertAction(title: "Genia!", style: .default, handler: nil )
        
//
        alert.addAction(action)

        present(alert, animated: true)

    }
    
    
}
 
