//
//  ViewController.swift
//  ApredendoVideoPlayerAnimando
//
//  Created by Caio Vinicius Pinho Vasconcelos on 16/01/20.
//  Copyright © 2020 Caio Vinicius Pinho Vasconcelos. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var positionYVideoPlayer: CGFloat = 0
    var maxY: CGFloat = 0
    
    let tableView: UITableView = {
        let tableView = UITableView(frame: CGRect.zero, style: .plain)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    var playerVideo: VideoPlayerView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.configScreen()
    }
    
    private func configScreen() {
        self.configTableView()
        
        self.maxY = self.view.bounds.height - (self.view.bounds.height / 3 + 40)
    }
    
    private func configTableView() {
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.register(VideosTableViewCell.self, forCellReuseIdentifier: "cell")
        
        self.view.addSubview(self.tableView)
        
        NSLayoutConstraint.activate([
            self.tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0),
            self.tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0),
            self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0),
        ])
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
    
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! VideosTableViewCell
        
        cell.bind(text: " - \(indexPath.row)")
        
        return cell
    
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let playerVideo = self.playerVideo {
            playerVideo.removeFromSuperview()
            self.positionYVideoPlayer = 0
        }
        
        self.playerVideo = VideoPlayerView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height))
        
        self.playerVideo!.delegate = self
        
        self.view.addSubview(self.playerVideo!)
    }
    
}



