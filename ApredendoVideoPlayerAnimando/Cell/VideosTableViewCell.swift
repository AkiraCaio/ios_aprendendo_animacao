//
//  VideosTableViewCell.swift
//  ApredendoVideoPlayerAnimando
//
//  Created by Caio Vinicius Pinho Vasconcelos on 16/01/20.
//  Copyright © 2020 Caio Vinicius Pinho Vasconcelos. All rights reserved.
//

import UIKit

class VideosTableViewCell: UITableViewCell {
    
    
    let label: UILabel = {
        let lbl = UILabel(frame: CGRect.zero)
        
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "-"
        lbl.textColor = .blue
        
        return lbl
    }()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.configScreen()

    }
    
    func bind(text: String) {
        self.label.text = text
    }
    
    private func configScreen() {
        self.configLabel()
    }
    
    private func configLabel() {
        self.addSubview(self.label)
        
        NSLayoutConstraint.activate([
            self.label.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8),
            self.label.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8),
            self.label.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            self.label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8)
        ])
    }
    
    

}
