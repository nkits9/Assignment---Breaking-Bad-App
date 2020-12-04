//
//  NetworkCharactersManager.swift
//  MVC-BreakingBadAPI
//
//  Created by MOHIT SHARMA on 04/12/20.
//
import UIKit

extension UIViewController {
    
    func showEmptyStateView(with message: String, in view: UIView) {
        let emptyStateView = BBEmptyStateView(message: message)
        emptyStateView.frame = view.bounds
        view.addSubview(emptyStateView)
    }
    
    func presentAlert(title: String, message: String, buttonTitle: String) {
        let alertVC = BBAlertVC(title: title, message: message, buttonTitle: buttonTitle)
        alertVC.modalPresentationStyle  = .overFullScreen
        alertVC.modalTransitionStyle    = .crossDissolve
        present(alertVC, animated: true)
    }
}
