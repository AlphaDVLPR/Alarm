//
//  SwitchTableViewCell.swift
//  myAlarm
//
//  Created by AlphaDVLPR on 8/5/19.
//  Copyright © 2019 trevorAdcock. All rights reserved.
//

import UIKit

protocol AlarmListTableViewDelegate: class {
    func switchCellSwitchValueChanged(cell: SwitchTableViewCell, isOn: Bool)
    
}
class SwitchTableViewCell: UITableViewCell {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var nameLAbel: UILabel!
    @IBOutlet weak var alarmSwitch: UISwitch!
    
    weak var delegate: AlarmListTableViewDelegate?
    
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
        delegate?.switchCellSwitchValueChanged(cell: self, isOn: alarmSwitch.isOn)
    }
}
