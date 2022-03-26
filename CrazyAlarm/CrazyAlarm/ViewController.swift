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
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        textField.inputView = datePicker
        createDatePicker()
        // Do any additional setup after loading the view.
    }
    func createDatePicker() {
        setTime.textAlignment = .center
        
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
        datePicker.datePickerMode = .time
    }
    @objc func donePressed() {
        // formatter
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .medium
        setTime.text = formatter.string(from: datePicker.date)
        self.view.endEditing(true)
    }
}

