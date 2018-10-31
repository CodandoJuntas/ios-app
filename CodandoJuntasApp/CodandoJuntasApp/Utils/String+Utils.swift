//
//  String+Utils.swift
//  InstaNorris
//
//  Created by Aline Borges on 17/05/18.
//  Copyright © 2018 Aline Borges. All rights reserved.
//

import Foundation
import UIKit

//stackoverflow.com/questions/1324379/how-to-calculate-the-width-of-a-text-string-of-a-specific-font-and-font-size
extension String {
    
    func width(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedStringKey.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
    
    func height(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedStringKey.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.height
    }
    
    func size(usingFont font: UIFont) -> CGSize {
        let fontAttributes = [NSAttributedStringKey.font: font]
        return self.size(withAttributes: fontAttributes)
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
    
}
