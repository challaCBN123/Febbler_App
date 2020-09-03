//
//  messageVC.swift
//  febbler
//
//  Created by Bhargava on 02/09/20.
//  Copyright © 2020 Bhargava. All rights reserved.
//

import UIKit

class messageVC: UIViewController {
var keybordenabled = false
    var scrollView = UIScrollView()
    @IBOutlet weak var childView: UIView!
    @IBOutlet weak var childViewHeight: NSLayoutConstraint!
    @IBOutlet weak var commentsTxtViewHeight: NSLayoutConstraint!
    @IBOutlet weak var dismissView: UIView!
    @IBOutlet var mainView: UIView!
    @IBOutlet weak var commentsTblView: UITableView!
    @IBOutlet weak var CommentsTextView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        if UIScreen.main.bounds.height < 700{
            childViewHeight.constant = 380
        }
        notificationCenter()
         
        self.CommentsTextView.contentInset = UIEdgeInsets(top: 9, left: 20, bottom: 5, right: 4)
        self.roundCorners(myview: childView, cornerRadius: 20)
        CommentsTextView.layer.cornerRadius = 30
        CommentsTextView.text = "Comment Here"
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        self.dismissView.addGestureRecognizer(tapGesture)
    }
  
    func notificationCenter(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisappear), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillAppear), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    @objc func handleTap(_ sender: UITapGestureRecognizer) {
        self.dismiss(animated: true, completion: nil)
    }
  @objc func keyboardWillAppear(_ notification: NSNotification) {

   
     }

  @objc func keyboardWillDisappear(_ notification: NSNotification) {

  
     }


    
    func roundCorners(myview:UIView,cornerRadius: Double) {
        let path = UIBezierPath(roundedRect: myview.bounds, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = myview.bounds
        maskLayer.path = path.cgPath
        myview.layer.mask = maskLayer
    }
    @IBAction func didTapDismiss(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func didTapSendComments(_ sender: UIButton) {
    }
    

}

