//
//  VideoPlayerView.swift
//  ApredendoVideoPlayerAnimando
//
//  Created by Caio Vinicius Pinho Vasconcelos on 17/01/20.
//  Copyright © 2020 Caio Vinicius Pinho Vasconcelos. All rights reserved.
//

import UIKit

protocol VideoPlayerViewDelegate {
    func begin(gestureRecognizer: UIPanGestureRecognizer)
    func update(gestureRecognizer: UIPanGestureRecognizer)
    func ended(gestureRecognizer: UIPanGestureRecognizer)
}

class VideoPlayerView: UIView {

    var viewBG: UIView?
    
    var delegate: VideoPlayerViewDelegate!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .blue
        
        self.configViewBG()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configViewBG() {
        
        self.viewBG = UIView(frame: CGRect(x: 0, y: 40, width: self.layer.bounds.width, height: self.layer.bounds.height / 3))
        self.viewBG!.backgroundColor = .red
        
        self.addSubview(self.viewBG!)
        
        self.viewBG?.addGestureRecognizer(
            UIPanGestureRecognizer(
                target: self,
                action: #selector(VideoPlayerView.panCallback)
            )
        )
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

   

}
