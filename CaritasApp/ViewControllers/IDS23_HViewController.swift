//
//  IDS23_HViewController.swift
//  CaritasApp
//
//  Created by Santiago A.A.M on 07/10/21.
//

import UIKit


class IDS23_HViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var donationsArray = [Donation]()
    var donation: Donation?
    var fetch = false
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as! IDS23_DViewController
        
        if segue.identifier == "donationDetailsSegue" {
            vc.donation = donationsArray[donationsTableView.indexPathForSelectedRow!.row]
            vc.fetch = true
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return donationsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "donationsCell", for: indexPath)
        
        cell.textLabel?.text = donationsArray[indexPath.row].creationDate
        return cell
    }

    @IBOutlet weak var donationsTableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        
        APIFunctions.functions.fetchDonations()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        APIFunctions.functions.fetchDonations()
    }
    
    @IBAction func onCloseButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        APIFunctions.functions.delegate = self
        APIFunctions.functions.fetchDonations()
      
        donationsTableView.delegate = self
        donationsTableView.dataSource = self
    }
}
    

extension IDS23_HViewController: DataDelegate {
    
    func updateArray(newArray: String) {
        
        do {
            donationsArray = try JSONDecoder().decode([Donation].self, from: newArray.data(using: .utf8)!)
            print(donationsArray)
        } catch {
            print("Failed to decode!")
            
        }
        self.donationsTableView?.reloadData()
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
