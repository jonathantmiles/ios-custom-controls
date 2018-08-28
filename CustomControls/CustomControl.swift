//
//  CustomControl.swift
//  CustomControls
//
//  Created by Jonathan T. Miles on 8/28/18.
//  Copyright © 2018 Jonathan T. Miles. All rights reserved.
//

import Foundation
import UIKit

class CustomControl: UIControl {
    let value: Int = 1
    
    let componentDimension: CGFloat = 40.0
    let componentCount = 5
    let componentActiveColor = UIColor.black
    let componentInactiveColor = UIColor.gray
    
    required init?(coder aCoder: NSCoder) {
        super.init(coder: aCoder)
        
        setup()
    }
    
    private func setup() {
        let oneStarSubview = UILabel()
        let twoStarSubview = UILabel()
        let threeStarSubview = UILabel()
        let fourStarSubview = UILabel()
        let fiveStarSubview = UILabel()
        
        self.addSubview(oneStarSubview)
        self.addSubview(twoStarSubview)
        self.addSubview(threeStarSubview)
        self.addSubview(fourStarSubview)
        self.addSubview(fiveStarSubview)
        
        oneStarSubview.tag = 1
        twoStarSubview.tag = 2
        threeStarSubview.tag = 3
        fourStarSubview.tag = 4
        fiveStarSubview.tag = 5
        
        oneStarSubview.frame = CGRect(x: 0.0, y: 0.0, width: componentDimension, height: componentDimension)
        twoStarSubview.frame = CGRect(x: (componentDimension + 8.0), y: 0.0, width: componentDimension, height: componentDimension)
        threeStarSubview.frame = CGRect(x: 2 * (componentDimension + 8.0), y: 0.0, width: componentDimension, height: componentDimension)
        fourStarSubview.frame = CGRect(x: 3 * (componentDimension + 8.0), y: 0.0, width: componentDimension, height: componentDimension)
        fiveStarSubview.frame = CGRect(x: 4 * (componentDimension + 8.0), y: 0.0, width: componentDimension, height: componentDimension)
        
        oneStarSubview.font = UIFont.boldSystemFont(ofSize: 32.0)
        oneStarSubview.text = "★"
        oneStarSubview.textAlignment = .center
        oneStarSubview.textColor = self.componentActiveColor
        
        twoStarSubview.font = UIFont.boldSystemFont(ofSize: 32.0)
        twoStarSubview.text = "★"
        twoStarSubview.textAlignment = .center
        twoStarSubview.textColor = self.componentInactiveColor
        
        threeStarSubview.font = UIFont.boldSystemFont(ofSize: 32.0)
        threeStarSubview.text = "★"
        threeStarSubview.textAlignment = .center
        threeStarSubview.textColor = self.componentInactiveColor
        
        fourStarSubview.font = UIFont.boldSystemFont(ofSize: 32.0)
        fourStarSubview.text = "★"
        fourStarSubview.textAlignment = .center
        fourStarSubview.textColor = self.componentInactiveColor
        
        fiveStarSubview.font = UIFont.boldSystemFont(ofSize: 32.0)
        fiveStarSubview.text = "★"
        fiveStarSubview.textAlignment = .center
        fiveStarSubview.textColor = self.componentInactiveColor
        
        let starArray = [oneStarSubview, twoStarSubview, threeStarSubview, fourStarSubview, fiveStarSubview]
    }
    
    override func beginTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        updateValue(at: touch)
        return true
    }
    
    override func continueTracking(_ touch: UITouch, with event: UIEvent?) -> Bool {
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            sendActions(for: [.touchDragInside, .valueChanged])
            updateValue(at: touch)
        } else {
            sendActions(for: [.touchDragOutside])
        }
        return true
    }
    
    override func endTracking(_ touch: UITouch?, with event: UIEvent?) {
        guard let touch = touch else { return }
        
        let touchPoint = touch.location(in: self)
        if bounds.contains(touchPoint) {
            sendActions(for: [.touchUpInside, .valueChanged])
            updateValue(at: touch)
        } else {
            sendActions(for: [.touchUpOutside])
        }
    }
    
    override func cancelTracking(with event: UIEvent?) {
        sendActions(for: .touchCancel)
    }
    
    func updateValue(at touch: UITouch) {
        
    }
    
    
    override var intrinsicContentSize: CGSize {
        let componentsWidth = CGFloat(componentCount) * componentDimension
        let componentsSpacing = CGFloat(componentCount + 1) * 8.0
        let width = componentsWidth + componentsSpacing
        return CGSize(width: width, height: componentDimension)
    }
    
}
