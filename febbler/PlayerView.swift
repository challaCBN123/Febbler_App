//
//  PlayerView.swift
//  febbler
//
//  Created by Bhargava on 31/08/20.
//  Copyright © 2020 Bhargava. All rights reserved.
//

import Foundation
import UIKit
import AVKit
import AVFoundation

class PlayerViewClass: UIView {

    override static var layerClass: AnyClass {
        return AVPlayerLayer.self
    }

    var playerLayer: AVPlayerLayer {
    
        return layer as! AVPlayerLayer
    }

    var player: AVPlayer? {
        get {
            return playerLayer.player
        }
    
        set {
            playerLayer.player = newValue
        }
    }
}
