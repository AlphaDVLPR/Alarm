//
//  AlarmController.swift
//  myAlarm
//
//  Created by AlphaDVLPR on 8/5/19.
//  Copyright © 2019 trevorAdcock. All rights reserved.
//

import Foundation

//Create Class

class AlarmController {
    
    //SINGLETON
    
    static var shared = AlarmController()
    
    //Create variables
    
    var alarms = [Alarm]()
    
    //CRUD
    
    //CREATE
    
    func createAlarm(fireDate: Date, name: String, enabled: Bool) {
        
        let alarm = Alarm(fireDate: fireDate, name: name, enabled: enabled)
        
        alarms.append(alarm)
        
        saveToPersistentStore()
    }
    
    //UPDATE
    
    func updateAlarm(alarm: Alarm, oldAlarmIndex alarmIndex: Int) {
        
        alarms[alarmIndex] = alarm
        
        saveToPersistentStore()
        
    }
    
    //DELETE
    
    func deleteAlarm(alarmIndex: Int) {
        
        alarms.remove(at: alarmIndex)
        
        saveToPersistentStore()

    }
    
    func setIsOn(for alarm: Alarm, enabled: Bool) {
        alarm.enabled = enabled
    }
    
    //CREATE PERSISTENCE

    // MARK: - Persistence
    
    func createFileURLForPersistence() -> URL {
        
        // Grab the users document directory
        
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        // Create the new fileURL on user's phone
        
        let fileURL = urls[0].appendingPathComponent("myAlarm.json")

        return fileURL
    }

    func saveToPersistentStore() {
        
        // Create an instance of JSON Encoder
        
        let jsonEncoder = JSONEncoder()
        
        // Attempt to convert our quotes to JSON
        
        do {
            let jsonJournals = try jsonEncoder.encode(alarms)
            
            // With the new json(d) quote, save it to the users device
            
            try jsonJournals.write(to: createFileURLForPersistence())
        } catch let encodingError {
            
            // Handle the error, if there is one
            
            print("There was an error saving!! \(encodingError.localizedDescription)")
        }
    }

    func loadFromPersistentStore() {
        
        // The data we want will be JSON, and I want it to be a Quote.
        
        let jsonDecoder = JSONDecoder()
        
        //Decode the data
        
        do {
            let jsonData = try Data(contentsOf: createFileURLForPersistence())
            let decodedPlaylist = try jsonDecoder.decode([Alarm].self, from: jsonData)
            alarms = decodedPlaylist
        } catch let decodingError {
            print("There was an error decoding!! \(decodingError.localizedDescription)")
        }
    }
}
