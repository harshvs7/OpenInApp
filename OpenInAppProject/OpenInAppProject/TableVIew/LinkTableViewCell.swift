//
//  LinkTableViewCell.swift
//  OpenInAppProject
//
//  Created by Harshwardhan Sharma on 24/05/23.
//

import UIKit

class LinkTableViewCell: UITableViewCell {
        
    // MARK: IB Outlets
    @IBOutlet weak var logoView: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var totalClicks: UILabel!
    @IBOutlet weak var copyButton: UIButton!
    @IBOutlet weak var link: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: Setting Up Values
    func settingUpTableTopView(response: TopLinks){
            logoView.loadImage(response.original_image!)
            title.text = response.title
            link.text = response.web_link
            date.text = dateFormatter(created_at: response.created_at!)
            //        date.text = "1222222"
            totalClicks.text = "\(String(describing: response.total_clicks!))"
        }
    
    func settingUpTableRecentView(response: RecentLinks){
        logoView.loadImage(response.original_image!)
        title.text = response.title
        link.text = response.web_link
        date.text = dateFormatter(created_at: response.created_at!)
        totalClicks.text = "\(String(describing: response.total_clicks!))"
    }
    
    // MARK: Function to deformat date
    func dateFormatter(created_at: String) -> String {
        let dateString = created_at
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        let result = dateFormatter.date(from: dateString)
        dateFormatter.dateFormat = "dd-MM-yyyy"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        let str = dateFormatter.string(from: result!)
        return str
    }
}

// MARK: Function to display image from url
extension UIImageView {
    func loadImage(_ imagePath: String) {
        let url = URL(string: imagePath)!
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

