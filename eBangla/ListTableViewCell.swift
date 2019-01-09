//
//  ListTableViewCell.swift
//  eBangla
//
//  Created by Md Abu Sufian on 9/1/19.
//  Copyright © 2019 Md Abu Sufian. All rights reserved.
//

import FoldingCell
import UIKit

class ListTableViewCell: FoldingCell {
    
    
    @IBOutlet var foregroundViewImageView: UIImageView!
    @IBOutlet var foregroundViewNameLablel: UILabel!
    @IBOutlet var foregroundViewWriterLabel: UILabel!
    
    
    @IBOutlet var containerViewImageView: UIImageView!
    @IBOutlet var containerViewNameLablel: UILabel!
    @IBOutlet var containerViewWriterLabel: UILabel!
    
    @IBOutlet var addToCartButton: UIButton!

    override func awakeFromNib() {
        foregroundView.layer.cornerRadius = 10
        foregroundView.layer.masksToBounds = true
        super.awakeFromNib()
    }
    
    override func animationDuration(_ itemIndex: NSInteger, type _: FoldingCell.AnimationType) -> TimeInterval {
        let durations = [0.26, 0.2, 0.2]
        return durations[itemIndex]
    }
}

// MARK: - Actions ⚡️

extension ListTableViewCell {
    
    @IBAction func buttonHandler(_: AnyObject) {
        print("tap")
    }
}
