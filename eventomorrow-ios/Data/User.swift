//
//  User.swift
//  eventomorrow-ios
//
//  Created by Vo The Dong An on 1/16/18.
//  Copyright © 2018 Nguyen Ngoc Son. All rights reserved.
//

import Foundation
import SwiftyJSON
struct User{
    var profile: Profile?
    var token: String?
    init(profile: Profile, token: JSON) {
        self.profile = profile
        self.token = token["token"].stringValue
    }
}
