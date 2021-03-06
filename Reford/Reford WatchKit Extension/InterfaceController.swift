//
//  InterfaceController.swift
//  Reford WatchKit Extension
//
//  Created by victor augusteo on 13/06/2015.
//  Copyright © 2015 augusteo. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var picker: WKInterfacePicker!
  
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        picker.setItems(setupPicker())
    }
    
    override func willActivate() {
        super.willActivate()
        
        let defaults = NSUserDefaults.standardUserDefaults()
        let started: Bool = defaults.boolForKey("isMatchStarted")
        
        if started {
            self.pushControllerWithName("matchIdentifier", context: nil)
        }
    }
    
    func setupPicker() -> [WKPickerItem] {
        var pickerArray:[WKPickerItem] = []
        
        for i: Int in 1...99 {
            let pickerItem = WKPickerItem()
            pickerItem.title = "\(i)"
            pickerArray.append(pickerItem)
        }
        
        return pickerArray
    }
    
    @IBAction func onStartTapped() {
        // initialize singleton
        _ = MatchModel.instance
    }
}
