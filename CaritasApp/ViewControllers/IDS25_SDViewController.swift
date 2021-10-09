//
//  IDS25_SDViewController.swift
//  CaritasApp
//
//  Created by Enrique Ruiz on 08/10/21.
//

import UIKit

protocol DataDelegate {
    func updateArray(newArray: String)
}

class IDS25_SDViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var donationsArray = [Donation]()
    
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "prototypeCell", for: indexPath)
        
        cell.textLabel?.text = donationsArray[indexPath.row].creationDate
        return cell
    }
    
    @IBOutlet weak var donationsTableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        
        APIFunctionsPrueba.functions.fetchDonations()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        APIFunctionsPrueba.functions.fetchDonations()
    }
    

    @IBAction func onGoButton(_ sender: Any) {
        performSegue(withIdentifier: "DonatorToHistory", sender: self)
    }
    
    @IBAction func onCloseButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        APIFunctionsPrueba.functions.delegate = self
        APIFunctionsPrueba.functions.fetchDonations()
      
        donationsTableView.delegate = self
        donationsTableView.dataSource = self

        // Do any additional setup after loading the view.
    }
}
    
extension IDS25_SDViewController: DataDelegate {
    
    func updateArray(newArray: String) {
        
        do {
            donationsArray = try JSONDecoder().decode([Donation].self, from: newArray.data(using: .utf8)!)
            print(donationsArray)
        } catch {
            print("Failed to decode!")
            
        }
        self.donationsTableView?.reloadData()
    }



    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
