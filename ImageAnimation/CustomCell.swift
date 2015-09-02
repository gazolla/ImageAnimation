//
//  CustomCell.swift
//  ImageAnimation
//
//  Created by Gazolla on 02/09/15.
//  Copyright (c) 2015 Gazolla. All rights reserved.
//

import UIKit

class CustomCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.imgView)
    }
    
    lazy var imgView:UIImageView = {
        var iv = UIImageView()
        iv.contentMode = UIViewContentMode.ScaleAspectFill
        return iv
        }()
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.imgView.frame = CGRectMake(6,15,self.frame.width*0.2, self.frame.height*0.8)
    }
}
