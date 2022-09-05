//
//  CustomTextFieldView.swift
//  Cinemalust
//
//  Created by Muhammed Nadeem on 30/08/22.
//  Copyright © 2022 Genysis.inc. All rights reserved.
//

import UIKit

@IBDesignable
class CustomTextFieldView: UIView {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var eyeBttn: UIButton!
    
    var eyeButtonPressed: Bool = false
    var onClick: ((Bool) -> Void)?

    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    private func setupView() {
        let view = viewFromNib()
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
        setStyle()
    }
    
    private func viewFromNib() -> UIView {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        return view
    }
    
    func setStyle(){
        containerView.layer.cornerRadius = 10
        containerView.layer.borderColor = UIColor.gray.cgColor
        containerView.layer.borderWidth = 0.5
        containerView.clipsToBounds = true
    }
    
    @IBAction func eyeButtonTapped(_ sender: UIButton) {
        eyeButtonPressed = !eyeButtonPressed
        self.onClick?(eyeButtonPressed)
    }
    
}
