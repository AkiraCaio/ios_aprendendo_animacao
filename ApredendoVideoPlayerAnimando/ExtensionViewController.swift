//
//  ExtensionViewController.swift
//  ApredendoVideoPlayerAnimando
//
//  Created by Caio Vinicius Pinho Vasconcelos on 17/01/20.
//  Copyright © 2020 Caio Vinicius Pinho Vasconcelos. All rights reserved.
//

import Foundation
import UIKit

extension ViewController: VideoPlayerViewDelegate {
    func begin(gestureRecognizer: UIPanGestureRecognizer) {
        if let playerVideo = self.playerVideo {

            gestureRecognizer.setTranslation(CGPoint(x: playerVideo.center.x, y: self.positionYVideoPlayer), in: self.view)
        }
    }
    
    func update(gestureRecognizer: UIPanGestureRecognizer) {
        
        if let playerVideo = self.playerVideo {
            UIView.animate(withDuration: 0.1, animations: {
                
                playerVideo.frame.origin.y = gestureRecognizer.translation(in: self.view).y
                
                print("\(playerVideo.frame.origin.y)")
                print("\(( playerVideo.frame.origin.y ) / self.maxY)")
                
                playerVideo.viewBG!.frame.size.width =
                    ( self.view.bounds.width ) - ( self.view.bounds.width / 2)
                    * ( ( playerVideo.frame.origin.y ) / self.maxY )
                
                
//                playerVideo.viewBG!.frame.origin.x =
//                     ( self.view.bounds.width / 2)
//                    * ( ( playerVideo.frame.origin.y ) / self.maxY ) - ( self.view.bounds.width )
                
                
//                self.view.layoutIfNeeded()
                
            }) { (_) in
                
            }
        }
    }
    
    func ended(gestureRecognizer: UIPanGestureRecognizer) {
        if let playerVideo = self.playerVideo {
            if (gestureRecognizer.translation(in: playerVideo).y >= (self.view.bounds.height / 3)) {
               
                UIView.animate(withDuration: 0.5, animations: {
                    playerVideo.frame.origin.y =  self.view.bounds.height - self.view.bounds.height / 3 - 40
                    
                }) { (_) in
                    self.positionYVideoPlayer = playerVideo.frame.origin.y

                }
            }else {
                UIView.animate(withDuration: 0.5, animations: {
                    playerVideo.frame.origin.y = 0
                    
                }) { (_) in
                    self.positionYVideoPlayer = playerVideo.frame.origin.y

                }
            }

        }
    }
    
    
}
