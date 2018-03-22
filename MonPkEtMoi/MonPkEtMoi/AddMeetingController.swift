//
//  AddMeetingController.swift
//  MonPkEtMoi
//
//  Created by Clement ROIG on 19/03/2018.
//  Copyright © 2018 Roig-Dye. All rights reserved.
//

import Foundation
import UIKit

class AddMeetingController : UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    let practitionerDAO = CoreDataDAOFactory.getInstance().getPractitionerDAO()
    let appointmentDAO = CoreDataDAOFactory.getInstance().getAppointmentDAO()

    var practitioners: [Practitioner?] = []
    
    @IBOutlet weak var hourPicker: UIDatePicker!
    @IBOutlet weak var dayPicker: UIDatePicker!
    @IBOutlet weak var practitionerPicker: UIPickerView!
    
    @IBAction func stepper(_ sender: UIStepper) {
        self.travelTimeL.text = String(Int(sender.value))
    }
    
    @IBOutlet weak var travelTimeL: UILabel!
    
    @IBAction func addMeetingButton(_ sender: Any) {
        var newAppointment = Appointment()
        do {
            newAppointment = try appointmentDAO.create()
        } catch {
            AlertHelper.alertError(view: self, errorMessage: "Erreur à la création du rendez-vous.")
        }
        
        // Construct date
        let day = dayPicker.date
        let hour = hourPicker.date
        
        let calendar = Calendar.current
        var dateComponents = calendar.dateComponents([.year, .month, .day], from: day)
        let timeComponents = calendar.dateComponents([.hour, .minute], from: hour)
       
        dateComponents.hour = timeComponents.hour
        dateComponents.minute = timeComponents.minute
        let date = calendar.date(from: dateComponents)
        
        // Other attributes
        newAppointment.date = date! as NSDate
        newAppointment.proposedBy = practitioners[practitionerPicker.selectedRow(inComponent: 0)]
        newAppointment.travelTime = Int16(travelTimeL.text!)!
        
        do {
            try appointmentDAO.save()
            self.performSegue(withIdentifier: "test", sender: self)
        } catch {
            AlertHelper.alertError(view: self, errorMessage: "Erreur à la sauvegarde du rendez-vous.")
            print("Error info: \(error)")
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dayPicker.minimumDate = Date()
        
        
        // Get Data
        do {
            self.practitioners = try practitionerDAO.getAll()
        } catch {
            fatalError("Erreur lors de l'obtention des médecins.")
        }
        
        self.practitioners = self.practitioners.sorted {
            if($0?.master?.wording == $1?.master?.wording) {
                return ($0?.lastName)! < ($1?.lastName)!
            }
            else {
                return ($0?.master?.wording)! < ($1?.master?.wording)!
            }
        }
        
        self.travelTimeL.text = "0"
    }
    
    @IBAction func goBackToOneButtonTapped(_ sender: Any) {
        performSegue(withIdentifier: "unwindSegueToAgenda", sender: self)
    }
    
    // MARK: Picker functions
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return practitioners.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        var title = practitioners[row]?.lastName?.uppercased()
        let firstName = practitioners[row]?.firstName
        let specialism = practitioners[row]?.master?.wording
        title = title! + " " + firstName! + " - " + specialism!
        return title
    }
    
}
