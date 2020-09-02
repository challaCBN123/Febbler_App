//
//  HomeVC.swift
//  febbler
//
//  Created by Bhargava on 28/08/20.
//  Copyright © 2020 Bhargava. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit


class HomeVC: UIViewController {
    @IBOutlet weak var btnView: UIView!
    @IBOutlet weak var btnViewHeight: NSLayoutConstraint!
    var myArray = NSArray()
    var player : AVPlayer?
    var playerLayer : AVPlayerLayer?
     let BaseService = servicesToGetData()
     let baseURl = "https://interview-e18de.firebaseio.com/media.json?print=pretty"
     let serviceUrl = ""
    
    @IBOutlet weak var clView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.clViewNibFile()
        self.clView.delegate = self
        self.clView.dataSource = self
        getData()
        if UIScreen.main.bounds.height < 700{
            btnViewHeight.constant = 40
        }
        // Do any additional setup after loading the view.
    }
    func getData(){
        BaseService.getDataFromUrl(baseUrl: baseURl, serviceUrl: serviceUrl) { (urlData, error) in
            //print(urlData)
            if error != nil {
                print(error)
            }
            self.myArray = urlData as! NSArray
            //print(self.myArray)
            self.clView.reloadData()
        }
    }
    func clViewNibFile(){
        let nibName = UINib.init(nibName: "videosCell", bundle: nil)
        self.clView.register(nibName, forCellWithReuseIdentifier: "videosCell")
    }
    @IBAction func didTap_Home(_ sender: UIButton) {
        self.clView?.scrollToItem(at: IndexPath(item: 0, section: 0) as IndexPath,at: .top,animated: true)
    }
    @IBAction func didTap_Camera(_ sender: UIButton) {
        
    }
    @IBAction func didTap_Search(_ sender: UIButton) {
        goToSearchController()
    }
    @IBAction func didTap_Notifications(_ sender: UIButton) {
      goToNotificationController()
    }
    @IBAction func didTap_SignIn(_ sender: UIButton) {
       goToLogInController()
    }
}
extension HomeVC{
    func goToSearchController(){
        let searchController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "SearchVC") as! SearchVC
        self.navigationController?.present(searchController, animated: true, completion: nil)
    }
    func goToNotificationController(){
          let notificationController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "NotificationVC") as! NotificationVC
                 self.navigationController?.present(notificationController, animated: true, completion: nil)
       }
    func goToLogInController(){
             let logInController = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "LoginVC") as! LoginVC
                    self.navigationController?.present(logInController, animated: true, completion: nil)
          }
}
extension HomeVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,dataTransferDelegate{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myArray.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = clView.dequeueReusableCell(withReuseIdentifier: "videosCell", for: indexPath) as! videosCell
       let dataDict = myArray[indexPath.row] as! NSDictionary
        cell.titleLbl.text = "@\(dataDict.value(forKey: "title") as! String)"
        cell.likeCount.text = String(100)
       // cell.MessageButton.target(forAction: #selector(presentMsgVc), withSender: Any?.self)
        
      
        let webURl = dataDict.value(forKey: "url") as! String
        guard let videoUrl = URL(string: webURl) else {fatalError()}
            player = AVPlayer(url: videoUrl)
            playerLayer = AVPlayerLayer(player: player)
            playerLayer?.zPosition = -1
            playerLayer?.frame = cell.playerView.frame
            playerLayer?.videoGravity = .resizeAspectFill
            cell.contentView.layer.addSublayer(playerLayer!)
            player?.play()
        cell.playerLayer = playerLayer
            cell.player = player
        cell.indexPath? = indexPath
        cell.delegate = self
        
        return cell
    }
    func gotoMessageController(index: Int) {
        presentMsgVc()
    }
    func presentMsgVc(){
        let storyBoard = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(identifier: "messageVC") as! messageVC
        self.navigationController?.present(storyBoard, animated: true, completion: nil)
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        (cell as! videosCell).player?.play()
    }

    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        (cell as! videosCell).player?.pause()
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let sizes = self.clView.frame
        let size = CGSize(width: sizes.width , height: sizes.height)
        return size
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
