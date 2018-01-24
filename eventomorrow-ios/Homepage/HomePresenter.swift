//
//  HomePresenter.swift
//  DemoMVP
//
//  Created by Pham Nguyen Nhat Anh on 1/15/18.
//  Copyright © 2018 Nguyen Ngoc Son. All rights reserved.
//

import Foundation


protocol HomeView{
    func getUpcommingEvent(events: [Event])
    func getPastEvent(events: [Event])
    func getSearchEvent(events: [Event])
}

protocol HomePresenterProtocol{
    func handleUpcommingEvent(pagenumber: Int)
    func handlePastEvent(pagenumber: Int)
    func handleSearchEvent()
    func getFirstEvents()
}


class HomePresenter : HomePresenterProtocol{
    fileprivate var homeView:HomeView?
    var homeService:HomeService
    init() {
        homeService = HomeService()
    }
    
    func attachView(_ view: HomeView){
        homeView = view
    }
    
    func handleUpcommingEvent(pagenumber: Int) {
        homeService.getUpcomingEvent(pagenumber: pagenumber) { (result) in
            switch result {
            case .failure(let error):
                print("error : \(error)")
            case .success(let events):
                self.homeView?.getUpcommingEvent(events: events)
            }
        }
    }
    
    func getFirstEvents(){
        homeService.getUpcomingEvent(pagenumber: 0) { (result) in
            switch result {
            case .failure(let error):
                print("error : \(error)")
            case .success(let events):
                self.homeView?.getUpcommingEvent(events: events)
            }
        }
    }
    
    func handlePastEvent(pagenumber: Int) {
        homeService.getPastEvent(pagenumber: pagenumber) { (result) in
            switch result {
            case .failure(let error):
                print("error : \(error)")
            case .success(let events):
                self.homeView?.getPastEvent(events: events)
            }
        }
        
    }
    
    func handleSearchEvent() {
        print("abc")
    }
}

