//
//  HomeViewController.swift
//  DemoMVP
//
//  Created by Pham Nguyen Nhat Anh on 1/15/18.
//  Copyright © 2018 Nguyen Ngoc Son. All rights reserved.
//

import UIKit
import Alamofire
enum HomepageButtonSelected {
    case upcomingevent
    case pastevent
}


class HomeViewController: UIViewController, HomeView {
    @IBOutlet weak var btnUpcommingEvent: UIButton!
    @IBOutlet weak var btnPastEvent: UIButton!
    var checkHomepageButtonSelected: HomepageButtonSelected = .upcomingevent
    var events = [Event]()
    var loadingEvents = [Event]()
    private let refreshControl = UIRefreshControl()

    let homePresenter = HomePresenter()
    @IBOutlet weak var tableView: UITableView?
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setBackgroundColorButton()
        homePresenter.attachView(self)
        homePresenter.getFirstEvents()
        tableView?.delegate = self
        tableView?.dataSource = self
        
        if #available(iOS 10.0, *) {
            self.tableView?.refreshControl = self.refreshControl
        } else {
            self.tableView?.addSubview(self.refreshControl)
        }
        
        self.refreshControl.addTarget(self, action: #selector(refreshData), for: .valueChanged)

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func btnUpcomingEvent_Tapped(_ sender: UIButton) {
        // update UI
        self.checkHomepageButtonSelected = .upcomingevent
        self.setBackgroundColorButton()
        // reload upcoming events
        refreshData()
    }
    
    @IBAction func btnPastEvent_Tapped(_ sender: UIButton) {
        // update UI
        self.checkHomepageButtonSelected = .pastevent
        self.setBackgroundColorButton()
        // reload past events
        refreshData()
    }
    
    private func setBackgroundColorButton(){
        if checkHomepageButtonSelected == .upcomingevent{
            btnUpcommingEvent.backgroundColor = UIColor(red: 1.0/255.5, green: 115.0/255.0, blue: 164.0/255.5, alpha: 1)
        }else{
            btnUpcommingEvent.backgroundColor = UIColor(red: 54.0/255.5, green: 55.0/255.0, blue: 65.0/255.5, alpha: 1)
        }
        if checkHomepageButtonSelected == .pastevent {
            btnPastEvent.backgroundColor = UIColor(red: 1.0/255.5, green: 115.0/255.0, blue: 164.0/255.5, alpha: 1)
        }else{
            btnPastEvent.backgroundColor = UIColor(red: 54.0/255.5, green: 55.0/255.0, blue: 65.0/255.5, alpha: 1)
        }
    }
    
    func getUpcommingEvent(events: [Event]) {
        appendEvents(events)
    }
    
    func getPastEvent(events: [Event]) {
        appendEvents(events)
    }
    
    func appendEvents(_ events: [Event]) {
        LoadingOverlay.shared.hide()
        guard events.count > 0 else { return }
        if (self.refreshControl.isRefreshing) {
            self.refreshControl.endRefreshing()
        }
        if loadingEvents.count == 0 {
            // refreshing data
            loadingEvents = events
            self.events = events
            tableView?.reloadData()
        } else {
            // load more
            // updated events
            let updatedCount = self.events.count - loadingEvents.count
            var updateIndexPaths = [IndexPath]()
            for idx in loadingEvents.count..<self.events.count {
                updateIndexPaths.append(IndexPath(row:idx, section:0))
            }
            
            // added events
            loadingEvents += events
            let addedCount = loadingEvents.count - self.events.count
            var addIndexPaths = [IndexPath]()
            for idx in self.events.count..<loadingEvents.count {
                addIndexPaths.append(IndexPath(row:idx, section:0))
            }
            
            // update events list
            self.events = loadingEvents
            
            // update table view UI
            tableView?.beginUpdates()
            if updatedCount > 0 {
                tableView?.reloadRows(at: updateIndexPaths, with: .none)
            }
            
            if (addedCount > 0) {
                tableView?.insertRows(at: addIndexPaths, with: .automatic)
            }
            tableView?.endUpdates()
        }
    }
    
    func getSearchEvent(events: [Event]) {
        print(events)
    }
    
    @objc private func refreshData() {
        loadingEvents = [Event]()
        loadMore()
    }
    
    func loadMore() {
        LoadingOverlay.shared.show(view: self.view)
        let oddElements = loadingEvents.count % HomeService.PAGE_SIZE
        if oddElements != 0 {
            let lastIdx = loadingEvents.count - oddElements
            loadingEvents = [Event](loadingEvents[0...lastIdx])
        }
        let pageNumber = loadingEvents.count / HomeService.PAGE_SIZE
        if (self.checkHomepageButtonSelected == .upcomingevent){
            self.homePresenter.handleUpcommingEvent(pagenumber: pageNumber)

        }else{
            self.homePresenter.handlePastEvent(pagenumber: pageNumber)
        }
    }

}

// Table view
extension HomeViewController : UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! CustomCell
        let eachEvent = self.events[indexPath.row]
        cell.lblTitle?.text = eachEvent.title
        cell.lblVenue?.text = eachEvent.venue
        cell.imgCover?.image = nil
        cell.imgCover?.getImageFromURL(urlString: eachEvent.coverImage ?? "")
        if let date = eachEvent.startTime{
                    print(date)
                    var dateConvert = Date(timeIntervalSince1970: TimeInterval( date / 1000))
                    print(dateConvert)
                    let calendar = Calendar.current
                    let monthNumber:Int = calendar.component(.month, from: dateConvert)
                    let day = calendar.component(.day, from: dateConvert)
                    cell.lblDay?.text = "\(day)"
                    cell.lblMonth?.text = StringHelper.getMonthStandfor(monthNumber)
        
        } else {
            // ?
        }
        // cell reuse
        return cell
    }
    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

//    }
//
    func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == events.count - 1 {
//            loadMore()
        }
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let dragDistance = scrollView.contentOffset.y + scrollView.bounds.size.height - scrollView.contentSize.height
        if (dragDistance >= 80) {
            loadMore()
        }
    }
}
