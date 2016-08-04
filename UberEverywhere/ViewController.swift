//
//  ViewController.swift
//  UberEverywhere
//
//  Created by Bryan Ayllon on 8/3/16.
//  Copyright © 2016 Bryan Ayllon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @NSCopying var timeZone: NSTimeZone?

    var dateString :String!
    
    
    @IBOutlet weak var myDatePicker: UIDatePicker!
    
    
    @IBOutlet weak var selectedDate: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
     myDatePicker.addTarget(self, action: #selector(ViewController.datePickerValueChanged), forControlEvents: UIControlEvents.ValueChanged)    }

    func datePickerValueChanged (datePicker: UIDatePicker) {
        
        let dateformatter = NSDateFormatter()
        
        dateformatter.dateStyle = NSDateFormatterStyle.MediumStyle
        dateformatter.timeStyle = NSDateFormatterStyle.ShortStyle
        
        let dateValue = dateformatter.stringFromDate(datePicker.date)
        
        
        
        selectedDate.text = dateValue
        dateString = dateValue

        
        
    }
    
    
    @IBAction func uberButtonisPressed() {
        
        let calendar = NSCalendar.currentCalendar()
        guard let alarmDate = calendar.dateByAddingUnit(.Second, value: 10, toDate: NSDate(), options: []) else {
            fatalError("Unable to add date")
            
        }
        
        
        
        [AZNotification .showNotificationWithTitle("Success your uber ride has been schueduled!", controller: self, notificationType: AZNotificationType.Success)]
        
        [AZNotificationType.Success]
        let notifaction = UILocalNotification()
        notifaction.alertTitle = "Uber is here"
        notifaction.alertBody = dateString
        notifaction.alertAction = "Slide to see Uber Details"
        notifaction.fireDate = alarmDate
        notifaction.category = "rsvpCategory"
        notifaction.userInfo = ["alarmDate":alarmDate]
        UIApplication.sharedApplication().scheduleLocalNotification(notifaction)

        print("skirtSkirt")
        
//        [AZNotification showNotificationWithTitle:@"Success! Now let's play!" controller:self notificationType:AZNotificationTypeSuccess shouldShowNotificationUnderNavigationBar:YES];
//   
    
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

