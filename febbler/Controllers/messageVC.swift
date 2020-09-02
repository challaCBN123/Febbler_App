//
//  messageVC.swift
//  febbler
//
//  Created by Bhargava on 02/09/20.
//  Copyright © 2020 Bhargava. All rights reserved.
//

import UIKit

class messageVC: UIViewController {

    @IBOutlet weak var childView: UIView!
    @IBOutlet weak var childViewHeight: NSLayoutConstraint!
    @IBOutlet weak var commentsTxtViewHeight: NSLayoutConstraint!
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var commentsTblView: UITableView!
    @IBOutlet weak var CommentsTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if UIScreen.main.bounds.height < 700{
            childViewHeight.constant = 350
        }
        self.childView.roundCorners(cornerRadius: 20)
        CommentsTextView.layer.cornerRadius = 30
        // Do any additional setup after loading the view.
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(messageVC.handleTap(_:)))
        mainView.addGestureRecognizer(tapGesture)
    }
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func didTapDismiss(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didTapSendComments(_ sender: UIButton) {
    }
    

}

