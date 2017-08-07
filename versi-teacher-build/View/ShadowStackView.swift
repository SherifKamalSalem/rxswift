//
//  ShadowStackView.swift
//  versi-teacher-build
//
//  Created by Caleb Stultz on 8/2/17.
//  Copyright © 2017 Caleb Stultz. All rights reserved.
//

import UIKit

class ShadowStackView: UIStackView {
    override func awakeFromNib() {
        self.layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.layer.shadowRadius = 10
        self.layer.shadowOpacity = 0.75
        super.awakeFromNib()
    }
}
