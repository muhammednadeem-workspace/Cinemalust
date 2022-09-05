//
//  UIButton + Extension.swift
//  Cinemalust
//
//  Created by Muhammed Nadeem on 28/08/22.
//

import Foundation
import UIKit

extension UIButton{
    
    /*Set Primary Color*/
    func primaryBtn(shadow :Bool = false){
        self.adjustsImageWhenHighlighted = false
        self.contentEdgeInsets = UIEdgeInsets(top:0,left:10,bottom:0,right:10)
        self.backgroundColor = .setColour(colour: .ambient)
        self.layer.cornerRadius = 5
        self.titleLabel?.adjustsFontSizeToFitWidth = true
        self.setTitleColor(.white, for: .normal)
        if shadow {
            self.layer.shadowOffset = CGSize(width: 0, height: 5)
            self.layer.shadowColor = #colorLiteral(red: 0.09411764706, green: 0.09411764706, blue: 0.09411764706, alpha: 1)
            self.layer.shadowOpacity = 1
            self.layer.shadowRadius = 5
        }
    }
    
    /*Set Secondary Color*/
    func secondaryBtn(){
        self.adjustsImageWhenHighlighted = false
        self.contentEdgeInsets = UIEdgeInsets(top:0,left:10,bottom:0,right:10)
        self.backgroundColor = .setColour(colour: .white)
        self.layer.cornerRadius = 5
        self.setTitleColor(.setColour(colour: .ambient), for: .normal)
        self.titleLabel?.adjustsFontSizeToFitWidth = true
    }
    
    func borderedButton(color : UIColor = UIColor.setColour(colour: .white), borderWidth: CGFloat = 0.5){
        self.adjustsImageWhenHighlighted = false
        self.contentEdgeInsets = UIEdgeInsets(top:0,left:10,bottom:0,right:10)
        self.backgroundColor = .setColour(colour: .white)
        self.layer.cornerRadius = 15
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = color.cgColor
        self.titleLabel?.adjustsFontSizeToFitWidth = true
        self.setTitleColor(.setColour(colour: .black), for: .normal)
    }
    
    
    func enableStringAnimation() {
            addTarget(self, action: #selector(animateDown), for: [.touchDown, .touchDragEnter])
            addTarget(self, action: #selector(animateUp), for: [.touchDragExit, .touchCancel, .touchUpInside, .touchUpOutside])
        }
        
        @objc private func animateDown(sender: UIButton) {
            animate(sender, transform: CGAffineTransform.identity.scaledBy(x: 0.95, y: 0.95))
        }
        
        @objc private func animateUp(sender: UIButton) {
            animate(sender, transform: .identity)
        }
        
        private func animate(_ button: UIButton, transform: CGAffineTransform) {
            UIView.animate(withDuration: 0.3,
                           delay: 0,
                           usingSpringWithDamping: 0.5,
                           initialSpringVelocity: 3,
                           options: [.curveEaseInOut],
                           animations: {
                            button.transform = transform
                }, completion: nil)
        }
}
