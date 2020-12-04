//
//  NetworkCharactersManager.swift
//  MVC-BreakingBadAPI
//
//  Created by MOHIT SHARMA on 04/12/20.
//
import UIKit

extension UILabel {
    func applyBBStyle() {
        adjustsFontSizeToFitWidth = true
        textColor = .label
        minimumScaleFactor = 0.9
        lineBreakMode = .byTruncatingTail
        textAlignment = .center
        font = UIFont.systemFont(ofSize: 26, weight: .bold)
    }
    
    func applyBBStyleForBBCell() {
        textAlignment = .center
        adjustsFontSizeToFitWidth = true
        textColor = .label
        minimumScaleFactor = 0.9
        lineBreakMode = .byTruncatingTail
        textAlignment = .center
    }
}
