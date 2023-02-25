//
//  UIView+Ext.swift
//  iOS Animations
//
//  Created by Артем Галай on 25.02.23.
//

import UIKit

extension UIView {
    func addBackground() {

        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height

        let imageViewBackground = UIImageView(frame: CGRectMake(0, 0, width, height))
        imageViewBackground.image = UIImage(named: "backgroundClouds")
        imageViewBackground.contentMode = UIView.ContentMode.scaleAspectFill

        self.addSubview(imageViewBackground)
        self.sendSubviewToBack(imageViewBackground)
    }
}
