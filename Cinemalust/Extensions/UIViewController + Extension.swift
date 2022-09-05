//
//  UIViewController + Extension.swift
//  Cinemalust
//
//  Created by Muhammed Nadeem on 30/08/22.
//  Copyright © 2022 Genysis.inc. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController{
    
    //MARK: No action
    func alertWithNoAction(title : String = "Coming Soon...", delay : Int = 2){
        let alertController = UIAlertController(title: title, message: nil, preferredStyle: .alert)
        self.present(alertController, animated: true) {
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(delay)){
                alertController.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    //MARK: Alert with action
    func showMessageAlert(title: String = "Error", message: String?, showRetry: Bool = true, retryTitle: String? = nil, showCancel: Bool = true, cancelTitle: String? = nil, onRetry: (() -> ())?, onCancel: (() -> ())?){
        
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            if showRetry{
                alertController.addAction(UIAlertAction(title: retryTitle ?? "Retry", style: .default, handler: { (retry) in
                    guard let onRetry = onRetry else{
                        return
                    }
                    onRetry()
                }))
            }
            if showCancel{
                alertController.addAction(UIAlertAction(title: cancelTitle ?? "Cancel", style: .cancel, handler: { (cancel) in
                    guard let onCancel = onCancel else{
                        return
                    }
                    onCancel()
                }))
            }
            self.present(alertController, animated: true, completion: nil)
        }
    }
    
    
    //MARK: Dismiss or Pop Viewcontroller
    func dismissVC(){
        if (self.presentingViewController != nil){
            self.dismiss(animated: true, completion: nil)
        }else{
            _ = navigationController?.popViewController(animated: true)
        }
    }
    
}
