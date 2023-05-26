//
//  VarietyCollectionViewCell.swift
//  OpenInAppProject
//
//  Created by Harshwardhan Sharma on 24/05/23.
//

import UIKit

class VarietyCollectionViewCell: UICollectionViewCell {
    // MARK: Variables
    var myImages = ["Avatar", "Avatar 2", "Avatar 3"]
    var titles = ["Today's Clicks","Top Location","Top Sources"]
    
    // MARK: IB Outlets 
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var labelOne: UILabel!
    @IBOutlet weak var labelTwo: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //MARK: Setting Up values
    func settingUpValue(pos: Int){
        iconView.image = UIImage(named: myImages[pos])
        labelTwo.text = titles[pos]
        
    }
    
}
