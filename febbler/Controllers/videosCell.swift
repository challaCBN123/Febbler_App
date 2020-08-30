//
//  videosCell.swift
//  febbler
//
//  Created by Bhargava on 29/08/20.
//  Copyright © 2020 Bhargava. All rights reserved.
//

import UIKit

class videosCell: UICollectionViewCell {
    @IBOutlet weak var LikeBtn: UIButton!
    @IBOutlet weak var MessageBtn: UIButton!
    @IBOutlet weak var ShareBtn: UIButton!
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var titleLbl : UILabel!
    @IBOutlet weak var likeCount:UILabel!
    @IBOutlet weak var messageCount:UILabel!
    @IBOutlet weak var videoProfileView: UIView!
     @IBOutlet weak var videoProfileImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        videoProfileView.roundCorners(cornerRadius: 20)
        videoProfileImage.layer.cornerRadius = self.videoProfileImage.frame.height/2
        // Initialization code
    }
    @IBAction func didTapVideo_Like(_ sender: UIButton) {
    }
    @IBAction func didTapMessage(_ sender: UIButton) {
    }
    @IBAction func didTapShare(_ sender: UIButton) {
    }

  
}

