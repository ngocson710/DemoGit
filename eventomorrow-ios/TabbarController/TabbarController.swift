//
//  ViewController.swift
//  DemoMVP
//
//  Created by Pham Nguyen Nhat Anh on 1/16/18.
//  Copyright © 2018 Nguyen Ngoc Son. All rights reserved.
//

import UIKit

class TabbarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()


        if #available(iOS 10.0, *) {
        self.tabBar.unselectedItemTintColor = UIColor.init(white: 1, alpha: 0.5)
        } else {
        // Fallback on earlier versions
        if let items = self.tabBar.items {
        let unselectedColor = UIColor.init(white: 1, alpha: 0.5)
        let selectedColor = UIColor.white
        // Unselected state colors
        for item in items {
        if let selectedImage = item.selectedImage?.with(color: unselectedColor)?.withRenderingMode(.alwaysOriginal) {
        item.image = selectedImage
        }
        }
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor : unselectedColor], for: .normal)

        // Selected state colors
        tabBar.tintColor = selectedColor
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.foregroundColor : selectedColor], for: .selected)
        }
        }

        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedStringKey.font: UIFont(name: "overpass-light", size: 12)!, NSAttributedStringKey.foregroundColor: UIColor.white], for: UIControlState.normal)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
