//
//  CalculationsListViewController.swift
//  TinkoffCalculator
//
//  Created by i.shvetsov on 23.11.2020.
//  Copyright © 2020 Tinkoff Bank. All rights reserved.
//

import UIKit

class CalculationsListViewController: UIViewController {
    
    var result: String?
    @IBOutlet weak var calculationLabel: UILabel!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        initalize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initalize()
    }
    
    private func initalize() {
        modalPresentationStyle = .fullScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculationLabel.text = result
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    @IBAction func dismissVC(_ sender: Any) {
        navigationController?.popViewController(animated: true)        
    }
}
