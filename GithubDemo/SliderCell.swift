//
//  SliderCell.swift
//  GithubDemo
//
//  Created by Dave Vo on 9/3/15.
//  Copyright (c) 2015 codepath. All rights reserved.
//

import UIKit

@objc protocol SliderCellDelegate {
    optional func sliderCell(sliderCell: SliderCell, didChangeValue value: Float)
}

class SliderCell: UITableViewCell {
    
    @IBOutlet weak var starSlider: UISlider!
    
    @IBOutlet weak var starLabel: UILabel!
    
    var delegate: SliderCellDelegate!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        starSlider.addTarget(self, action: "sliderValueChanged", forControlEvents: UIControlEvents.ValueChanged)
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    @IBAction func onSliderChange(sender: AnyObject) {
//        var sliderValude = String(format: "%.0f", starSlider.value)
//        starLabel.text = sliderValude
        
        if delegate != nil {
            delegate?.sliderCell?(self, didChangeValue: starSlider.value)
        }
    }
    

}
