//
//  RatingControl.swift
//  FoodTracker
//
//  Created by 耿楷寗 on 22/10/2017.
//  Copyright © 2017 EIE. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
    
    private var ratingButton=[UIButton]()
    var rating=0{
        didSet{
            updateButtonSelectionStatus()
        }
    }
    override init(frame: CGRect) {
        super.init(frame:frame)
        setUpButton()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setUpButton()
    }
    
    private func setUpButton(){
        
        let bundle=Bundle(for:type(of:self))
        let filledStar=UIImage(named: "filledStar",in: bundle,compatibleWith: self.traitCollection)
        let emptyStar=UIImage(named: "emptyStar",in: bundle,compatibleWith: self.traitCollection)
        let hightlightedStar=UIImage(named: "highlightedStar",in: bundle,compatibleWith: self.traitCollection)
        
        for button in ratingButton{
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButton.removeAll()
        
        for _ in 0..<starCount{
            let button=UIButton()
            button.setImage(filledStar, for:.selected)
            button.setImage(emptyStar,for: .normal)
            button.setImage(hightlightedStar, for: .highlighted)
            button.setImage(hightlightedStar, for: [.highlighted,.selected])
            button.translatesAutoresizingMaskIntoConstraints=false
            button.heightAnchor.constraint(equalToConstant: starSize.height).isActive=true
            button.widthAnchor.constraint(equalToConstant: starSize.width).isActive=true
            button.addTarget(self, action: #selector(rattingButtonTapped(button:)), for: .touchUpInside)
            button.accessibilityLabel="Set \(index) star rating"
            addArrangedSubview(button)
            ratingButton.append(button)
        }
         updateButtonSelectionStatus()
    }
    
    @objc func rattingButtonTapped(button: UIButton){
        guard let index=ratingButton.index(of:button) else{
            fatalError("The Button, \(button) , is not in the ratingButtons array: \(ratingButton)")
        }
        let selectedRating=index+1
        
        if selectedRating == rating {
            self.rating=0
        }else{
            self.rating=selectedRating
        }
    }
    private func updateButtonSelectionStatus(){
        for(index,button) in ratingButton.enumerated(){
            button.isSelected=index<rating
            let hintString:String?
            if rating == index+1{
                hintString="Tap to reset the rating to zero"
            }else{
                hintString=nil
            }
            let valueString:String?
            switch(rating){
            case 0:
                valueString = "No rating set."
            case 1:
                valueString = "1 star set."
            default:
                valueString = "\(rating) stars set."
            }
            button.accessibilityHint=hintString
            button.accessibilityValue=valueString
        }
        
    }
    @IBInspectable var starSize:CGSize = CGSize(width:44.0,height:44.0){
        didSet{
            setUpButton()
        }
    }
    @IBInspectable var starCount:Int = 5{
        didSet{
            setUpButton()
        }
    }
}
