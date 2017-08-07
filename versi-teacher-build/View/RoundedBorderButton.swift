//
//  RoundedBorderButton.swift
//  versi-teacher-build
//
//  Created by Caleb Stultz on 8/2/17.
//  Copyright © 2017 Caleb Stultz. All rights reserved.
//

import UIKit

class RoundedBorderButton: UIButton {
    override func awakeFromNib() {
        self.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0)
        self.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.layer.borderWidth = 3
        self.layer.cornerRadius = self.frame.height / 2
        super.awakeFromNib()
    }
}
