//
//  VideoPlayerView.swift
//  ApredendoVideoPlayerAnimando
//
//  Created by Caio Vinicius Pinho Vasconcelos on 17/01/20.
//  Copyright © 2020 Caio Vinicius Pinho Vasconcelos. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation

protocol VideoPlayerViewDelegate {
    func begin(gestureRecognizer: UIPanGestureRecognizer)
    func update(gestureRecognizer: UIPanGestureRecognizer)
    func ended(gestureRecognizer: UIPanGestureRecognizer)
}

class VideoPlayerView: UIView {

    var viewBG: AVPlayerLayer?
//    var playerLayer: AVPlayerLayer?
    
    var player: AVPlayer?

    var delegate: VideoPlayerViewDelegate!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .red
        
        self.addGestureRecognizer(
            UIPanGestureRecognizer(
                target: self,
                action: #selector(VideoPlayerView.panCallback)
            )
        )

        self.configViewBG()
        self.mountVideoPlayer()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configViewBG() {
        
//        self.viewBG = UIView(frame: CGRect(x: 0, y: 40, width: self.layer.bounds.width, height: self.layer.bounds.height / 3))
//        self.viewBG!.backgroundColor = .red
//
//        self.addSubview(self.viewBG!)
//
//        self.viewBG?.addGestureRecognizer(
//            UIPanGestureRecognizer(
//                target: self,
//                action: #selector(VideoPlayerView.panCallback)
//            )
//        )
//
//        self.viewBG!.clipsToBounds = true
    }
    
    @objc private func panCallback(gestureRecognizer: UIPanGestureRecognizer) {
        switch gestureRecognizer.state {
        
        case .began:
            print("Began")
            self.delegate.begin(gestureRecognizer: gestureRecognizer)
            
        case .ended:
            print("Ended")
            self.delegate.ended(gestureRecognizer: gestureRecognizer)
            
        case .changed:
//            print("Changed")
            
            self.delegate.update(gestureRecognizer: gestureRecognizer)
        
        case .cancelled:
            print("Cancelled")
        default:
            print("10")
        }
    }
    
    private func mountVideoPlayer() {
        if let url = URL(string: "https://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4") {
            //2. Create AVPlayer object
            let asset = AVAsset(url: url)
            let playerItem = AVPlayerItem(asset: asset)
            self.player = AVPlayer(playerItem: playerItem)
            
            //3. Create AVPlayerLayer object
            self.viewBG = AVPlayerLayer(player: player)
            self.viewBG!.frame = CGRect(x: 0, y: 0, width: self.layer.frame.width, height: self.layer.frame.height / 3)
            self.viewBG!.videoGravity = .resizeAspect
            
            //4. Add playerLayer to view's layer
            self.layer.addSublayer(viewBG!)
            
            //5. Play Video
            self.player!.play()
        }
    }

}
