//
//  ScanQRCodeVC.swift
//  Batmobile
//
//  Created by iApple Basement on 25/03/2024.
//  Copyright © 2024 Buglife. All rights reserved.
//

import UIKit

class ScanQRCodeVC: UIViewController, QRCodeScannerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func backButtonAction(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func ScaneButtonAction(_ sender: UIButton) {
        
        let scanner = QRCodeCameraScannerVC()
        scanner.delegate = self
        present(scanner, animated: true, completion: nil)
        
    }
    
    func didFindQRCode(_ result: String) {
        print("Scanned QR Code: \(result)")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            self.showAlert(title: "Scan Result", message: result)
        }
    }
    
}
