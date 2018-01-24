//
//  Reachability.swift
//  eventomorrow-ios
//
//  Created by Vo The Dong An on 1/23/18.
//  Copyright © 2018 Nguyen Ngoc Son. All rights reserved.
//

import Foundation
import Alamofire
public class Reachability {
    
    class var isConnectedToNetwork : Bool {
        return NetworkReachabilityManager()!.isReachable
    }
}
