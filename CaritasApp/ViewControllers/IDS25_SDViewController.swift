//
//  IDS25_SDViewController.swift
//  CaritasApp
//
//  Created by Enrique Ruiz on 08/10/21.
//

import UIKit
/*
protocol DataDelegate {
    func updateArray(newArray: String)
}
 */

class IDS25_SDViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var donatorsArray = [User]()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as! IDS23_HViewController
        
        if segue.identifier == "DonatorsToDonationsSegue" {            
            vc.donator = donatorsArray[donatorsTableView.indexPathForSelectedRow!.row]
            vc.fetch = true
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return donatorsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "donatorsCell", for: indexPath)
        
        cell.textLabel?.text = donatorsArray[indexPath.row].correo
        return cell
    }
    
    @IBOutlet weak var donatorsTableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        
        APIFunctions.functions.fetchDonators()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        APIFunctions.functions.fetchDonators()
    }
    

    
    @IBAction func onCloseButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        APIFunctions.functions.delegate = self
        APIFunctions.functions.fetchDonators()
      
        donatorsTableView.delegate = self
        donatorsTableView.dataSource = self

        // Do any additional setup after loading the view.
    }
}
    

extension IDS25_SDViewController: DataDelegate {
    
    func updateArray(newArray: String) {
        
        do {
            donatorsArray = try JSONDecoder().decode([User].self, from: newArray.data(using: .utf8)!)
            print(donatorsArray)
            //Almacenar solo los usuarios que son donadores
            donatorsArray = donatorsArray.filter{$0.rol == "Donador"}
            //print(donatorsArray)
        } catch {
            print("Failed to decode Donators!")
        }
        self.donatorsTableView?.reloadData()
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
