//
//  RoundedImageView.swift
//  Kindling
//
//  Created by Heather Connery on 2015-11-02.
//  Copyright © 2015 HConnery. All rights reserved.
//

import UIKit

class RoundedImageView: UIImageView {

    override func awakeFromNib() {
        //make sure parent awakes from nib first
        super.awakeFromNib()
        
        //meta data representation of a view is called layer property -> core graphics (base under UI)
        self.layer.cornerRadius = (bounds.size.width + bounds.size.height) / 4
  
        self.clipsToBounds = true
        
        
        
    }

}
