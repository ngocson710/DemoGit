//
//  HomeService.swift
//  DemoMVP
//
//  Created by Pham Nguyen Nhat Anh on 1/15/18.
//  Copyright © 2018 Nguyen Ngoc Son. All rights reserved.
//

import Foundation
import Alamofire

public class HomeService {
    let API_URL = "192.168.81.174:8080"
    public static let PAGE_SIZE = 5; //10
    
    func getUpcomingEvent(pagenumber: Int,completionHanler:@escaping (Result<[Event]>) -> Void){
        var events = [Event] ()
        Alamofire.request("http://\(API_URL)/events/upcoming-paging?page-number=\(pagenumber)&page-size=\(HomeService.PAGE_SIZE)&sort-key=startTime").responseJSON{(response) in
            switch response.result {
            case .failure(let error):
                completionHanler(Result<[Event]>.failure(error))
            case .success(let value):
                if let responseValue = value as? [String:Any],
                let rawData = responseValue["RESPONSE_LIST"] as? [[String : Any]] {
                    for jsonObj in rawData {
                        if let data = try? JSONSerialization.data(withJSONObject: jsonObj, options: []),
                            let obj = try? JSONDecoder().decode(Event.self, from: data) {
                            events.append(obj)
                        }
                    }
                }
                completionHanler(Result<[Event]>.success(events))
            }
        }
        

    }
    
    
    func getPastEvent(pagenumber: Int,completionHanler:@escaping (Result<[Event]>) -> Void){
        var events = [Event] ()
        Alamofire.request("http://192.168.81.174:8080/events/expired-paging?page-number=\(pagenumber)&page-size=\(HomeService.PAGE_SIZE)&sort-key=startTime").responseJSON{(response) in
            switch response.result {
            case .failure(let error):
                completionHanler(Result<[Event]>.failure(error))
            case .success(let value):
                if let responseValue = value as? [String:Any],
                    let rawData = responseValue["RESPONSE_LIST"] as? [[String : Any]] {
                    for jsonObj in rawData {
                        if let data = try? JSONSerialization.data(withJSONObject: jsonObj, options: []),
                            let obj = try? JSONDecoder().decode(Event.self, from: data) {
                            events.append(obj)
                        }
                    }
                }
                completionHanler(Result<[Event]>.success(events))
            }
        }
    }
}

