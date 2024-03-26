//
//  AskSiriForFood.swift
//  Batmobile
//
//  Created by iApple Basement on 25/03/2024.
//  Copyright © 2024 Buglife. All rights reserved.
//

import UIKit

class AskSiriForFood: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func nextButtonAction(_ sender: UIButton) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let askSiriVC = storyboard.instantiateViewController(withIdentifier: "ScanQRCodeVC") as! ScanQRCodeVC
        self.navigationController?.pushViewController(askSiriVC, animated: true)
        
    }
    
}
