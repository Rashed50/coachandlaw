//
//  VideoView.swift
//  CoachAndLaw
//
//  Created by Rashedul Hoque on 21/2/21.
//  Copyright © 2021 Rashedul Hoque. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

class VideoView: UIView {

    var playerLayer: AVPlayerLayer?
    var player: AVPlayer?
    var isLoop: Bool = false
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func configure(url: String) {
        if let videoURL = URL(string: url) {
            player = AVPlayer(url: videoURL)
            playerLayer = AVPlayerLayer(player: player)
            playerLayer?.frame = bounds
          //  playerLayer?.videoGravity = AVLayerVideoGravity.resize
          //  playerLayer!.videoGravity = AVLayerVideoGravity.resizeAspect
            
          //  playerLayer.frame = (featureView13?.bounds)!
            playerLayer!.videoGravity = .resizeAspectFill
        //    playerLayer!.contentsGravity = .resizeAspectFill
            
            if let playerLayer = self.playerLayer {
                layer.addSublayer(playerLayer)
            }
            NotificationCenter.default.addObserver(self, selector: #selector(reachTheEndOfTheVideo(_:)), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: self.player?.currentItem)
        }
    }
    
   @objc func play() {
   
    if player?.timeControlStatus != AVPlayer.TimeControlStatus.playing {
            player?.play()
        }
    }
    
    func pause() {
        player?.pause()
    }
    
    func stop() {
        player?.pause()
        player?.seek(to: CMTime.zero)
    }
    
    @objc func reachTheEndOfTheVideo(_ notification: Notification) {
        if isLoop {
            player?.pause()
            player?.seek(to: CMTime.zero)
            player?.play()
        }
    }
    
    
    

}
