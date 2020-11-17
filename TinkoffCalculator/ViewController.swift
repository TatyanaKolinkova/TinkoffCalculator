//
//  ViewController.swift
//  TinkoffCalculator
//
//  Created by t.khamidov on 15.11.2020.
//  Copyright © 2020 Tinkoff Bank. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("Та-дам!")
    }

    @IBAction func buttonPressed(_ sender: UIButton) {
        guard let buttonText = sender.currentTitle else { return }
        
        print(buttonText)
    }
    
}

