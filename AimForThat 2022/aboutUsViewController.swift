//
//  aboutUsViewController.swift
//  AimForThat 2022
//
//  Created by Alba Yolima Rico Montenegro on 31/05/22.
//

import UIKit
import WebKit

class aboutUsViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let url = Bundle.main.url(forResource: "AimForThat", withExtension: "html"){
            
            if let htmlData = try? Data(contentsOf: url){
                
                let baseURL = URL(fileURLWithPath:Bundle.main.bundlePath)
            
                
                self.webView.load(htmlData, mimeType: "text/html",characterEncodingName: "UTF-8", baseURL:  baseURL)
            }
            
        }
        
    
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func backPressed(){
        dismiss(animated: true, completion: nil)
    }
}
