//
//  ext-UIView.swift
//  Uberv2
//
//  Created by Amirah Nrl on 19/10/2020.
//

import UIKit

extension UIView {
    // MARK: - Anchor
    // Origin starts from left top point. +ve x rightwards, +ve y downwards
    func anchor(top: NSLayoutYAxisAnchor? = nil,
                left: NSLayoutXAxisAnchor? = nil,
                bottom: NSLayoutYAxisAnchor? = nil,
                right: NSLayoutXAxisAnchor? = nil,
                paddingTop: CGFloat = 0,
                paddingLeft: CGFloat = 0,
                paddingBottom: CGFloat = 0,
                paddingRight: CGFloat = 0,
                width: CGFloat? = nil,
                height: CGFloat? = nil) {
            
        translatesAutoresizingMaskIntoConstraints = false
            
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
            
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
            
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
            
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
        }
            
        if let width = width {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
            
        if let height = height {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
        
    func centerX(inView view: UIView, constant: CGFloat = 0) {
        centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: constant).isActive = true
    }
        
    func centerY(inview view: UIView, constant: CGFloat = 0) {
        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true
    }
    
    // MARK: - Separator
    enum SeparatorPosition {
        case top, bottom, left, right
    }
        
    @discardableResult
    func addSeparator(at position: SeparatorPosition, color: UIColor, weight: CGFloat = ANSizes.Separator.Weight / UIScreen.main.scale, insets: UIEdgeInsets = .zero) -> UIView {
        let view = UIView()
        view.backgroundColor = color
        view.alpha = ANColors.Alpha.SemiTransparent
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
            
        switch position {
        case .top:
            view.anchor(top: self.topAnchor, left: self.leftAnchor, right: self.rightAnchor, paddingTop: insets.top, paddingLeft: insets.left, paddingRight: insets.right, height: weight)
        case .bottom:
            view.anchor(left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, paddingLeft: insets.left, paddingBottom: insets.bottom, paddingRight: insets.right, height: weight)
        case .left:
            view.anchor(top: self.topAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, paddingTop: insets.top, paddingLeft: insets.left, paddingBottom: insets.bottom, width: weight)
        case .right:
            view.anchor(top: self.topAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, paddingTop: insets.top, paddingBottom: insets.bottom, paddingRight: insets.right, width: weight)
        }
            
        return view
    }
}
