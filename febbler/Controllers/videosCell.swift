//
//  videosCell.swift
//  febbler
//
//  Created by Bhargava on 29/08/20.
//  Copyright © 2020 Bhargava. All rights reserved.
//

import UIKit
import AVKit
protocol dataTransferDelegate{
    func gotoMessageController(index:Int)
}
class videosCell: UICollectionViewCell {
    
    var indexPath : IndexPath?
    var delegate : dataTransferDelegate?
    
    var transparentView = UIView()
    let navigationController = UINavigationController()
    //    var messageView = UIView()
    //     let height : CGFloat = 400
    //var MessageButton = UIButton()
    var isLikeClicked = true
    // var isMessageClicked = true
    var playerLayer: AVPlayerLayer?
    var player: AVPlayer?
    
    @IBOutlet weak var playerView: UIView!
    @IBOutlet weak var LikeBtn: UIButton!
    @IBOutlet weak var MessageBtn: UIButton!
    @IBOutlet weak var ShareBtn: UIButton!
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var titleLbl : UILabel!
    @IBOutlet weak var likeCount:UILabel!
    @IBOutlet weak var videoProfileView: UIView!
    @IBOutlet weak var videoProfileImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        playerLayer?.removeFromSuperlayer()
        player?.pause()
        videoProfileView.roundCorners(cornerRadius: 20)
        videoProfileImage.layer.cornerRadius = self.videoProfileImage.frame.height/2
    }
    
    @IBAction func didTapVideo_Like(_ sender: UIButton) {
        if isLikeClicked{
            LikeBtn.tintColor = .red
            
        }else{
            LikeBtn.tintColor = .lightGray
        }
        isLikeClicked = !isLikeClicked
    }
    @IBAction func didTapMessage(_ sender: UIButton) {
        delegate?.gotoMessageController(index: indexPath?.row ?? 0)
        
        //        let window = UIApplication.shared.keyWindow
        //        transparentView.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        //        transparentView.frame = self.contentView.frame
        //          window?.addSubview(transparentView)
        //
        //
        //        let screenSize = UIScreen.main.bounds.size
        //        messageView.backgroundColor = UIColor.white
        //        messageView.frame = CGRect(x: 0, y: screenSize.height, width: screenSize.width, height: height)
        //        window?.addSubview(messageView)
        //
        //
        //            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onClickableTransparentView))
        //        transparentView.addGestureRecognizer(tapGesture)
        //
        //        transparentView.alpha = 0
        //
        //        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
        //            self.transparentView.alpha = 0.5
        //            self.messageView.frame = CGRect(x: 0, y: screenSize.height - self.height, width: screenSize.width, height: self.height)
        //        }, completion: nil)
        
    }
    //    @objc func onClickableTransparentView(){
    //         let screenSize = UIScreen.main.bounds.size
    //        UIView.animate(withDuration: 0, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {
    //                   self.transparentView.alpha = 0
    //            self.messageView.frame = CGRect(x: 0, y: screenSize.height, width: screenSize.width, height: self.height)
    //               }, completion: nil)
    //    }
    @IBAction func didTapShare(_ sender: UIButton) {
        
    }
    
    
}

