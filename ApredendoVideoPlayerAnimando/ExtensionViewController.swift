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
            
            playerVideo.frame.size.height = self.view.frame.height
            
        }
    }
    
    func update(gestureRecognizer: UIPanGestureRecognizer) {
        
        if let playerVideo = self.playerVideo {
            UIView.animate(withDuration: 0.1, animations: {
                
                playerVideo.backgroundColor = playerVideo.backgroundColor?.withAlphaComponent(
                    (1 - ( playerVideo.frame.origin.y / self.maxY )))
                
                if (gestureRecognizer.translation(in: self.view).y >= 0 && gestureRecognizer.translation(in: self.view).y <= self.maxY) {
                    
                    playerVideo.frame.origin.y = gestureRecognizer.translation(in: self.view).y
                }
                
                playerVideo.frame.origin.x = ( self.view.frame.width / 2  - 8)
                    * ( ( playerVideo.frame.origin.y ) / self.maxY )

                playerVideo.frame.size.width =
                    ( self.view.frame.width ) - ( self.view.frame.width / 2 )
                    * ( ( playerVideo.frame.origin.y ) / self.maxY )
                
                if let viewBG = playerVideo.viewBG {
                    viewBG.frame.size = CGSize(
                        width:
                        ( self.view.bounds.width ) - ( self.view.bounds.width / 2 )
                            * ( ( playerVideo.frame.origin.y ) / self.maxY ),
                        height:
                        ( self.view.bounds.height / 3 ) - ( self.view.bounds.height / 6 )
                            * ( ( playerVideo.frame.origin.y ) / self.maxY )
                    )
                }
                
            }) { (_) in
                
            }
        }
    }
    
    func ended(gestureRecognizer: UIPanGestureRecognizer) {
        if let playerVideo = self.playerVideo {
            
            if (gestureRecognizer.translation(in: playerVideo).y >= ( self.view.bounds.height / 3 )) {
                
                UIView.animate(withDuration: 0.5, animations: {
                    
                    playerVideo.backgroundColor = playerVideo.backgroundColor?.withAlphaComponent(0)
                    
                    playerVideo.frame.origin = CGPoint(
                        x:
                            self.view.bounds.width / 2  - 8,
                        y:
                            self.maxY
                    )
                    
                    playerVideo.frame.size = CGSize(
                        width:
                            self.view.frame.width / 2,
                        height:
                            self.view.frame.height / 6
                    )
                    
                    if let viewBG = playerVideo.viewBG {
                        viewBG.frame.size = playerVideo.frame.size
                    }
                    
                }) { (_) in
                    self.positionYVideoPlayer = playerVideo.frame.origin.y
                }
                
            }else {
                UIView.animate(withDuration: 0.5, animations: {
                    
                    playerVideo.backgroundColor = playerVideo.backgroundColor?.withAlphaComponent(1)
                    
                    playerVideo.frame.origin = CGPoint(x: 0, y: 0)

                    playerVideo.frame.size = CGSize(
                        width: self.view.frame.width,
                        height: self.view.frame.height
                    )
                    
                    if let viewBG = playerVideo.viewBG {
                        
                        viewBG.frame.size = CGSize(
                            width: playerVideo.frame.width,
                            height: playerVideo.frame.height / 3
                        )
                    }
                    
                }) { (_) in
                    self.positionYVideoPlayer = playerVideo.frame.origin.y
                }
                
            }
            
        }
        
    }
    
}
