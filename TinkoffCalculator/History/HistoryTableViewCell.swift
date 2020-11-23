//
//  HistoryTableViewCell.swift
//  TinkoffCalculator
//
//  Created by Розалия Амирова on 23.11.2020.
//  Copyright © 2020 Tinkoff Bank. All rights reserved.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {
    
    @IBOutlet private var expressionLabel: UILabel!
    @IBOutlet private var resultLabel: UILabel!
    
    func configure(with expression: String, result: String) {
        expressionLabel.text = expression
        resultLabel.text = result
    }
}
