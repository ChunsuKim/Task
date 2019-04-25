//
//  FeedTableViewCell.swift
//  Instagram
//
//  Created by Chunsu Kim on 17/04/2019.
//  Copyright © 2019 Wi. All rights reserved.
//

import UIKit

protocol CommentButtonDelegate: class {
    func commentButtonDidTap(_ commentView: FeedTableViewCell)
}

class FeedTableViewCell: UITableViewCell {
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    @IBOutlet weak var nickNameLabel: UILabel!
    
    @IBOutlet weak var feedImageView: UIImageView!
    
    var delegate : CommentButtonDelegate?
    
    var model: FeedData!{
        didSet{
            profileImageView.image = UIImage(named: self.model.profileImage!)
            nickNameLabel.text = self.model.nickName
            feedImageView.image = UIImage(named: self.model.feedImage!)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        profileImageView.layer.cornerRadius = profileImageView.frame.width / 2
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func likeButtonDidTap(_ sender: UIButton) {
        sender.isSelected.toggle()
    }
    
    @IBAction func commentgo(_ sender: UIButton) {
       delegate?.commentButtonDidTap(self)
        
        
    }
    
    
    
}


