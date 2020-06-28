//
//  QuestionView.swift
//  OpenQuizz
//
//  Created by Martin Flament on 28/06/2020.
//  Copyright © 2020 Martin Flament. All rights reserved.
//

import UIKit

class QuestionView: UIView {

    @IBOutlet private var label: UILabel!
    @IBOutlet private var icon: UIImageView!

    var title = "" {
        didSet {
            label.text = title
        }
    }
    
    enum Style {
        case correct, incorrect, standard
    }
    
    var style: Style = .standard {
        didSet {
            setStyle(style)
        }
    }
    
    private func setStyle(_ style: Style) {
        switch style {
        case .correct:
            backgroundColor = UIColor(red: 200/255.0, green: 236/255.0, blue: 160/255.0, alpha: 0)
            icon.image = UIImage(named: "Icon Correct")
        case .incorrect:
            backgroundColor = UIColor(red: 243/255.0, green: 135/255.0, blue: 148/255.0, alpha: 0)
            icon.image = UIImage(named: "Icon Incorrect")
        case .standard:
            backgroundColor = UIColor(red: 200/255.0, green: 236/255.0, blue: 160/255.0, alpha: 0)
            icon.isHidden = false
        
        }
    }
    
}
