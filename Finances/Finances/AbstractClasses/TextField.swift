//
//  TextField.swift
//  Finances
//
//  Created by Maria Eugênia Pereira Teixeira on 24/10/20.
//

import UIKit

class TextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        borderStyle = .roundedRect
        textColor = .black
    }
}
