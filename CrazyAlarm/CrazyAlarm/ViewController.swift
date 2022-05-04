//
//  ViewController.swift
//  CrazyAlarm
//
//  Created by Vivian Duong on 3/25/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    
//    private let datePicker: UIDatePicker = {
////        let picker = UIDatePicker()
////        picker.datePickerMode = .time
////        return picker
//        let datePicker = UIDatePicker()
//        datePicker.datePickerMode = .time
//        return datePicker
//    }()
    
    @IBOutlet weak var setTime: UITextField!
    
    let datePicker = UIDatePicker()
    var stringDate = ""
    override func viewDidLoad() {
        super.viewDidLoad()
//        textField.inputView = datePicker
        createDatePicker()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func makeAlarm() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound], completionHandler: {successful, e in
            if successful {
                print("setting alarm next")
                self.setAlarm()
            }
        })
    }
    
    func setAlarm() {
        let notificationContent = UNMutableNotificationContent()
        notificationContent.title = "ALARM!"
        notificationContent.sound = .default
        notificationContent.body = "Please complete your activity to deactiviate alarm"
        
        let alarmTime = Date().addingTimeInterval(7)
        let trigger = UNCalendarNotificationTrigger(dateMatching: Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: alarmTime), repeats: false)
        let userRequest = UNNotificationRequest(identifier: "id_goes_here", content: notificationContent, trigger: trigger)
        UNUserNotificationCenter.current().add(userRequest, withCompletionHandler: { error in
            if error != nil {
                print("couldn't set alarm")
            }
            else {
                print("alarm set!")
            }
        })
        disarmAlarm()
    }
    
    func disarmAlarm() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    }
    
    func createDatePicker() {
      
        setTime.textAlignment = .center
        datePicker.preferredDatePickerStyle = .wheels
        datePicker.minimumDate = Date() // ensure the user cannot select a date in the future
        // toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit() // fit to width of screen
        
        // bar button done
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: true)
        // assign the toolbar to keyboard
        setTime.inputAccessoryView = toolbar
        
        // assign date picker to the text field
        setTime.inputView = datePicker
        
        // show only time
//        datePicker.datePickerMode = .time
    }
    @objc func donePressed() {
        // formatter
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.dateStyle = DateFormatter.Style.short
        formatter.timeStyle = DateFormatter.Style.short
        stringDate = formatter.string(from: datePicker.date)
        setTime.text = stringDate
        self.view.endEditing(true)
    }
}

