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
                
                playerVideo.backgroundColor = UIColor.blue.withAlphaComponent(1 - ( playerVideo.frame.origin.y / self.maxY ))
                
                if (gestureRecognizer.translation(in: self.view).y >= 0 && gestureRecognizer.translation(in: self.view).y <= self.maxY) {
                    
                    playerVideo.frame.origin.y = gestureRecognizer.translation(in: self.view).y
                }
                
//                print("\(playerVideo.frame.origin.y)")
//                print("\(( playerVideo.frame.origin.y ) / self.maxY)")
//
                playerVideo.viewBG!.frame.size.width =
                    ( self.view.bounds.width ) - ( self.view.bounds.width / 2)
                    * ( ( playerVideo.frame.origin.y ) / self.maxY )
                
                playerVideo.viewBG!.frame.origin.x = (self.view.bounds.width / 2)
                    * ( playerVideo.frame.origin.y ) / self.maxY
                
                playerVideo.viewBG!.frame.size.height =
                    ( self.view.bounds.height / 3 ) - ( self.view.bounds.height / 6)
                    * ( ( playerVideo.frame.origin.y ) / self.maxY )
    
            }) { (_) in
                
            }
        }
    }
    
    func ended(gestureRecognizer: UIPanGestureRecognizer) {
        if let playerVideo = self.playerVideo {
            if (gestureRecognizer.translation(in: playerVideo).y >= (self.view.bounds.height / 3)) {
               
                UIView.animate(withDuration: 0.5, animations: {
                    
                    playerVideo.backgroundColor = UIColor.blue.withAlphaComponent(0)
                    
                    playerVideo.frame.origin.y =  self.view.bounds.height - self.view.bounds.height / 3 - 40
                    
//                    playerVideo.frame.size.width = self.view.bounds.width / 2
//                    playerVideo.frame.size.height = self.view.bounds.height / 6
                    
                    
                    playerVideo.viewBG!.frame.size.width = self.view.bounds.width / 2
                    playerVideo.viewBG!.frame.origin.x = self.view.bounds.width / 2
                    
                    playerVideo.viewBG!.frame.size.height = (self.view.bounds.height / 6)
                    
                }) { (_) in
                    self.positionYVideoPlayer = playerVideo.frame.origin.y

                }
            }else {
                UIView.animate(withDuration: 0.5, animations: {
                    playerVideo.frame.origin.y = 0
                    
                    playerVideo.backgroundColor = UIColor.blue.withAlphaComponent(1)

//
//                    playerVideo.frame.size.width = self.view.bounds.width
//                    playerVideo.frame.size.height = self.view.bounds.height / 3
                    
                    
                    playerVideo.viewBG!.frame.size.width = playerVideo.bounds.width
                    playerVideo.viewBG!.frame.origin.x = 0
                    playerVideo.viewBG!.frame.size.height = ( self.view.bounds.height / 3 )
                    
                }) { (_) in
                    self.positionYVideoPlayer = playerVideo.frame.origin.y

                }
            }

        }
    }
    
    
}
