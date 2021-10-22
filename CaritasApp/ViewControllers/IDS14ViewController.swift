//
//  IDS14ViewController.swift
//  CaritasApp
//
//  Created by Santiago A.A.M on 06/10/21.
//

import UIKit
import FSCalendar

class IDS14ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, FSCalendarDelegate {
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        calendar.delegate = self
        APIFunctions.functions.delegate = self
        APIFunctions.functions.fetchDonations()
        
        calendarTableView.delegate = self
        calendarTableView.dataSource = self
    }
    
    @IBAction func onCloseButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBOutlet weak var calendarTableView: UITableView!
    @IBOutlet var calendar: FSCalendar!
    
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        let formatter = DateFormatter()
        formatter.dateFormat = "YYYY-MM-dd"
        MiVariable.fechaseleccionada = formatter.string(from: date)
        self.calendarTableView?.reloadData()
    }
    
    var donator: User?
    var fetch = false
    // Este archivo
    var donationsArray = [Donation]()
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as! IDS23_CViewController
        
        if segue.identifier == "CalendarDetailsSegue" {
            vc.donation = donationsArray[calendarTableView.indexPathForSelectedRow!.row]
            vc.fetch = true
         
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return donationsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "calendarCell", for: indexPath)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        /*if dateFormatter.string(from: donationsArray[indexPath.row].fecha_recepcion) == MiVariable.fechaseleccionada{
            cell.textLabel?.text = dateFormatter.string(from: donationsArray[indexPath.row].fecha_recepcion)
        }*/
        cell.textLabel?.text = dateFormatter.string(from: donationsArray[indexPath.row].fecha_recepcion!)
        //cell.textLabel?.text = donationsArray[indexPath.row]._id
        return cell
    }

    override func viewWillAppear(_ animated: Bool) {
        
        APIFunctions.functions.fetchDonations()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        APIFunctions.functions.fetchDonations()
    }
}



extension IDS14ViewController: DataDelegate {
    
    func updateArray(newArray: String) {
        
    
        do {
            let decoder = JSONDecoder()
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
            decoder.dateDecodingStrategy = .formatted(dateFormatter)
            donationsArray = try decoder.decode([Donation].self, from: newArray.data(using: .utf8)!)
            
            print(donationsArray)
            
        } catch {
            print("Failed to decode Donations!")
        }
        self.calendarTableView?.reloadData()
    }
}

 /*
 // MARK: - Navigation

 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
 }
 */
