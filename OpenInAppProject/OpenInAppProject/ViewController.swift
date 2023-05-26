//
//  ViewController.swift
//  OpenInAppProject
//
//  Created by Harshwardhan Sharma on 11/05/23.
//

import UIKit
import Charts
var flag = true

class ViewController: UIViewController, ChartViewDelegate {
    
    // MARK: IBOutlets
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var varietyCollectionView: UICollectionView!
    @IBOutlet weak var linkTableView: UITableView!
    @IBOutlet weak var greetingView: UILabel!
    @IBOutlet weak var linkSegment: UISegmentedControl!
    
    // MARK:  Properties
    var analytics: Analytics?
    var topLinks = [TopLinks]()
    var recentLinks = [RecentLinks]()

    // MARK: View Controller LifeCycles Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        apiloading()
        settingUpGreetings()
        setUpCollectionView()
        settingUpTableView()
        
    }
    
    // MARK: API Calling
    func apiloading(){
        APIManager.shared.callApi{ response in
            switch response{
            case .success( let analytics):
                self.topLinks = analytics.data.top_links
                self.recentLinks = analytics.data.recent_links
                self.analytics = analytics
                DispatchQueue.main.async {
                    self.linkTableView.reloadData()
                    self.varietyCollectionView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func settingUpGreetings(){
        let today = Date()
        let hours   = (Calendar.current.component(.hour, from: today))
        if (hours>=12 && hours<=16){
            greetingView.text = "Good Afternoon"
        }else if (hours>=5 && hours<12){
            greetingView.text = "Good Morning"
        }else if (hours>16 && hours<=20){
            greetingView.text = "Good Evening"
        }else if (hours>20 && hours<=5){
            greetingView.text = "Good Night"
        }
    }
    
    @IBAction func linkButton(_ sender: Any) {
        switch linkSegment.selectedSegmentIndex{
        case 0:
            flag = true
            linkTableView.reloadData()
        default:
            flag = false
            linkTableView.reloadData()
        }
    }
}

// MARK: CollectionView delegates and dataSources
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func setUpCollectionView() {
        varietyCollectionView.delegate = self
        varietyCollectionView.dataSource = self
        varietyCollectionView.register(UINib(nibName: "VarietyCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "varietyCollectionViewCell")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "varietyCollectionViewCell", for: indexPath) as! VarietyCollectionViewCell
        cell.settingUpValue(pos: indexPath.row)
        switch indexPath.row{
        case 0:
            cell.labelOne.text = "\(analytics?.today_clicks ?? 123)"
        case 1:
            cell.labelOne.text = analytics?.top_location
        default:
            cell.labelOne.text = analytics?.top_source
        }
        return cell
        
    }
    
}

// MARK: TableView Delegates and DataSources
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if flag {
            return topLinks.count
        }else{
            return recentLinks.count
        }
    }
    
    func settingUpTableView(){
        linkTableView.delegate = self
        linkTableView.dataSource = self
        linkTableView.frame = linkTableView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
        let nib = UINib(nibName: "LinkTableViewCell", bundle: nil)
        linkTableView.register(nib, forCellReuseIdentifier: "LinkTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LinkTableViewCell", for: indexPath) as! LinkTableViewCell
        if flag{
            cell.settingUpTableTopView(response: topLinks[indexPath.row])
        }else{
            cell.settingUpTableRecentView(response: recentLinks[indexPath.row])
        }
        return cell
    }
    
}
