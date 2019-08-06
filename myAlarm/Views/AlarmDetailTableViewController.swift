//
//  AlarmDetailTableViewController.swift
//  myAlarm
//
//  Created by AlphaDVLPR on 8/5/19.
//  Copyright © 2019 trevorAdcock. All rights reserved.
//

import UIKit

class AlarmDetailTableViewController: UITableViewController {

    var alarm: Alarm?  {
        
        didSet {
            
            updateViews()
            loadViewIfNeeded()
        }
    }
    
    var alarmIsOn: Bool = true
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var detailedTextView: UITextField!
    @IBOutlet weak var setAlarmButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    private func updateViews() {
        
        if let alarm = alarm {
            datePicker.date = alarm.fireDate
            detailedTextView.text = alarm.name
        }
        
        if alarmIsOn {
            
            setAlarmButton.setTitle("ON", for: .normal)
            
            setAlarmButton.backgroundColor = UIColor.blue
            
        } else if alarmIsOn {
            
            setAlarmButton.setTitle("OFF", for: .normal)
            
            setAlarmButton.backgroundColor = UIColor.red
        }
        
    }
    @IBAction func enableButtonTapped(_ sender: Any) {
        alarmIsOn.toggle()
        
        if alarmIsOn {
            
            setAlarmButton.setTitle("ON", for: .normal)
            
            setAlarmButton.backgroundColor = UIColor.blue
            
        } else if alarmIsOn {
            
            setAlarmButton.setTitle("OFF", for: .normal)
            
            setAlarmButton.backgroundColor = UIColor.red
        }

    }
    

}

