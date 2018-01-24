//
//  ExtensionUIImage.swift
//  DemoMVP
//
//  Created by Pham Nguyen Nhat Anh on 1/16/18.
//  Copyright © 2018 Nguyen Ngoc Son. All rights reserved.
//

import UIKit


extension UIImage {
    func with(color: UIColor) -> UIImage? {
        guard let cgImage = self.cgImage else {
            return self
        }
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        if let context = UIGraphicsGetCurrentContext() {
            context.translateBy(x: 0, y: size.height)
            context.scaleBy(x: 1.0, y: -1.0)
            context.setBlendMode(.normal)
            let imageRect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
            context.clip(to: imageRect, mask: cgImage)
            color.setFill()
            context.fill(imageRect)
            if let newImage = UIGraphicsGetImageFromCurrentImageContext() {
                UIGraphicsEndImageContext();
                return newImage
            }
        }
        return nil;
    }
}
