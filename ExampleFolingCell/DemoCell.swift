//
//  DemoCell.swift
//  FoldingCell
//
//  Created by Cristopher A. Bautista Gómez on 10/31/16.
//  Copyright © 2016 Cristopher A. Bautista Gómez. All rights reserved.
//

import UIKit
import FoldingCell

class DemoCell: FoldingCell {
  
  override func awakeFromNib() {
    
    foregroundView.layer.cornerRadius = 10
    foregroundView.layer.masksToBounds = true
    
    super.awakeFromNib()
  }
  
  override func animationDuration(_ itemIndex:NSInteger, type:AnimationType)-> TimeInterval {
    
    let durations = [0.26, 0.2, 0.2]
    return durations[itemIndex]
  }
}

// MARK: Actions
extension DemoCell {
  
  @IBAction func buttonHandler(_ sender: AnyObject) {
    print("tap")
  }
}
