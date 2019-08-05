//
//  AlarmListTableViewController.swift
//  myAlarm
//
//  Created by AlphaDVLPR on 8/5/19.
//  Copyright © 2019 trevorAdcock. All rights reserved.
//

import UIKit

class AlarmListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
 }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return AlarmController.shared.alarms.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "switchCell", for: indexPath) as? SwitchTableViewCell else {return UITableViewCell()}

        // Configure the cell...

        let alarm = AlarmController.shared.alarms[indexPath.row]
        
        cell.alarm = alarm
        cell.delegate = self
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */


    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            
            AlarmController.shared.deleteAlarm(alarmIndex: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        
        }    
    }


    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension AlarmListTableViewController : AlarmListTableViewDelegate {
    
    //Cell gets switched, calls delegate (which is the tableView)
    
    func switchCellSwitchValueChanged(cell: SwitchTableViewCell, isOn: Bool) {
        
        //Grab setting off the cell
        
        guard let alarm = cell.alarm,
        
        //Find indexPath of the cell (to be refreshed later)
        
        let indexPath = tableView.indexPath(for: cell) else { return }
        
        //Setting controller updates the setting
        
        AlarmController.shared.setIsOn(for: alarm, enabled: isOn)
        
        //Reload cell's row
        
        tableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
}
