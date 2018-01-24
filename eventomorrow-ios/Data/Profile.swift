//
//  Profile.swift
//  test-social-network-sdk
//
//  Created by Vo The Dong An on 1/16/18.
//  Copyright © 2018 AxonActive. All rights reserved.
//

import Foundation
import SwiftyJSON
struct Profile {
    var accountType: String?
    var address: String?
    var avatar: String?
    var birthday: Date?
    var company: String?
    var email: String?
    var enabled: Bool?
    var gender: String?
    var id: Int?
    var job: String?
    var lastPasswordResetDate: Date?
    var lastUpdatedDate: Date?
    var name: String?
    var phoneNumber: String?
    var profileId: String?
    var status: String?
    
    init(accountType: String?, address: String?,avatar: String?,company: String?,email: String?,gender: String?,job: String?,phoneNumber: String?,status: String?) {
        self.accountType = accountType
        self.address = address
        self.avatar = avatar
        self.company = company
        self.email = email
        self.gender = gender
        self.job = job
        self.phoneNumber = phoneNumber
        self.status = status
    }
    init(dict: JSON) {
        self.email = dict["email"].stringValue
        self.id = dict["id"].intValue
        self.job = dict["job"].stringValue
    }
}

