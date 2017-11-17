//
//  HotelTableViewController.swift
//  Hotel Apps iOS
//
//  Created by Jun  on 11/17/17.
//  Copyright © 2017 Arjuna. All rights reserved.
//

import UIKit

class HotelTableViewController: UITableViewController {

    var tasks : [Task] = []
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var namaSelected:String?
    var alamatSelected:String?
    var rateSelected:String?
    var fasilitasSelected:String?
    var lokasiSelected:String?
    override func viewDidLoad() {
        super.viewDidLoad()

            
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return tasks.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HotelTableViewCell

        // Configure the cell...
        //deklarasi dataTask sebagai Index dari tasks
        let dataTask = tasks[indexPath.row]
        //mengambildata dengan attribute name_Task
        if let myDataTask = dataTask.namahotel {
            //menampilkan data ke label
            cell.lblHotel.text = myDataTask
        }
        if let myDataTask1 = dataTask.alamat {
            cell.lblalamat.text = myDataTask1
        }
        if let myDataTask2 = dataTask.rate{
            cell.lblrate.text = myDataTask2
            
        }

        return cell
    }

    override func viewWillAppear(_ animated: Bool) {
        //memanggil method getData
        getData()
        //memanggil reloadData
        tableView.reloadData()
    }
    //method getData
    func getData() {
        //mengecek apakah ada error atau tidak
        do{
            //kondisi kalau tidak ada error
            //maka akan request download data
            tasks = try context.fetch(Task.fetchRequest())
        }
        catch{
            //kondisi apabila error fetch data
            print("Fetching Failed")
        }
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        //mengece menu swipe bila edit data
        if editingStyle == .delete {
            let task = tasks[indexPath.row]
            context.delete(task)
            //Delete data
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            do{
                //retrieve data
                tasks = try context.fetch(Task.fetchRequest())
            }
            catch{
                print("Fetching Failed")
            }
        }
        //load data lagi
        tableView.reloadData()
    }
        override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
            //mengecek data yang dikirim
            print("Row \(indexPath.row)selected")
            
            let task = tasks[indexPath.row]
            //memasukan data ke variable namaSelected dan image selected ke masing masing variable nya
            namaSelected = task.namahotel!
            //  gambarSelcetd = task["gambar"] as! String
            alamatSelected = task.alamat!
            rateSelected = task.rate!
            fasilitasSelected = task.fasilitas!
            lokasiSelected = task.lokasi!
            
            
            
            
            
            
            
            //memamnggil segue passDataDetail
            performSegue(withIdentifier: "PassData", sender: self)
        }
        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            //mengecek apakah segue nya ada atau  tidak`
            if segue.identifier == "PassData"{
                //kondisi ketika segue nya ada
                //mengirimkan data ke detailViewController
                //        let kirimData = segue.destination as! KontakViewController
                //mengirimkan data ke masing2 variable
                //mengirimkan nama wisata
                
                if let indexPath = self.tableView.indexPathForSelectedRow {
                    let controller = segue.destination as! ViewController
                    
                    let value = tasks[indexPath.row]
                    controller.passnama = value.namahotel as? String
                    controller.passalamat = value.alamat as? String
                    controller.passrate = value.rate as? String
                    controller.passlokasi = value.lokasi as? String
                    controller.passfasilitas = value.fasilitas as? String
                    //controller.passtelp = value["No_telp"] as? String
                    // controller.passgambar = value["gambar"] as? UIImage
                }
            
                
            }
        }
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


