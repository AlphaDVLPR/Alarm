//
//  SwitchTableViewCell.swift
//  myAlarm
//
//  Created by AlphaDVLPR on 8/5/19.
//  Copyright © 2019 trevorAdcock. All rights reserved.
//

import UIKit

class SwitchTableViewCell: UITableViewCell {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var nameLAbel: UILabel!
    @IBOutlet weak var alarmSwitch: UISwitch!
    
    var alarm: Alarm? {
        
        didSet {
            
            updateViews()
        }
    }

    func updateViews() {
        
        if let alarm = alarm {
            
            timeLabel.text = alarm.fireDate.description
            nameLAbel.text = alarm.name
            alarmSwitch.isOn = alarm.enabled
            
        }
        
        
    }
    @IBAction func switchValueChanged(_ sender: Any) {
    }
}
