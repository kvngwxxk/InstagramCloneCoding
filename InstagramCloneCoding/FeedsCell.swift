//
//  FeedsCell.swift
//  InstagramCloneCoding
//
//  Created by 이강욱 on 2021/10/02.
//

import Foundation
import UIKit
import SnapKit

class FeedsCell: UITableViewCell {
    var feed = UIView()
    
    var userProfileView = UIImageView()
    var userInfoLabel = UILabel()
    var locationLabel = UILabel()
    var moreButton = UIButton()
    
    var feedImageView = UIView()
    
    var likeButton = UIButton()
    var commentButton = UIButton()
    var dmButton = UIButton()
    var saveButton = UIButton()
    
    var howManyLikeLabel = UILabel()
    var commentLabel = UILabel()
    
    var myProfileView = UIView()
    var commentTextview = UITextView()
    
    var headerView = UIView()
    var mainView = UIView()
    var footerView = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        initHeaderView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func initHeaderView() {
        headerView.addSubview(userProfileView)
        headerView.addSubview(userInfoLabel)
        headerView.addSubview(locationLabel)
        headerView.addSubview(moreButton)
        userProfileView.snp.makeConstraints{ make in
            make.leading.equalToSuperview()
            make.width.height.equalTo(headerView.snp.height).multipliedBy(0.8)
        }
    }
}
