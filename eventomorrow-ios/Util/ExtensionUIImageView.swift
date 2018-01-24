//
//  ExtensionUIImageView.swift
//  DemoMVP
//
//  Created by Pham Nguyen Nhat Anh on 1/16/18.
//  Copyright © 2018 Nguyen Ngoc Son. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView{
    
    
    public func getImageFromURL(urlString: String){
        URLSession.shared.dataTask(with: NSURL(string: urlString) as! URL, completionHandler:{
            (data, response, error) -> Void in
            if error != nil{
                print(error!)
                return
            }
            DispatchQueue.main.async{ () -> Void in
                    let image = UIImage(data: data!)
                    self.image = image
                
            }
        }).resume()
    }
}
