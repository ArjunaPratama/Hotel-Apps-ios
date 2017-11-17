//
//  AddhotelViewController.swift
//  Hotel Apps iOS
//
//  Created by Jun  on 11/17/17.
//  Copyright © 2017 Arjuna. All rights reserved.
//

import UIKit

class AddhotelViewController: UIViewController {

    @IBOutlet weak var etlokasi: UITextField!
    @IBOutlet weak var etfasilitas: UITextField!
    @IBOutlet weak var etrate: UITextField!
    @IBOutlet weak var etalamat: UITextField!
    @IBOutlet weak var etnama: UITextField!
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //check what segue with name passData is available or not
        if(segue.identifier == "passData"){
            let sendData = segue.destination as! ViewController
            sendData.passnama = etnama.text!
            //send email data
            sendData.passlokasi = etlokasi.text!
            //send password data
            sendData.passrate = etrate.text!
            sendData.passfasilitas = etfasilitas.text!
            //send email data
            sendData.passalamat = etalamat.text!
            //send password data
        // Do any additional setup after loading the view.
    }
    
        func btnsve(_ sender: Any) {
        //deklarasi context
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        //deklarasi task
        let nameTask = Task(context: context) //deklarasi nameTask sebagai konteks dari entiti Task
        nameTask.namahotel = etnama.text //deklarasikan bahwa nameTask.name_task itu isinya dari etNametask.text
        
        nameTask.alamat = etalamat.text
        nameTask.rate = etrate.text
        nameTask.lokasi = etlokasi.text
        nameTask.fasilitas = etfasilitas.text
        
        //proses penyimpanan data core
        //mengecek apakah nilai dari etTask adalah kosong atau tidak
        if etnama.text == "" {
            //kondisi ketika kosong
            //tampil alert dialog
            let alert = UIAlertController(title: "Warning", message: "Task Cannot Be Empty", preferredStyle: UIAlertControllerStyle.alert)
            //menambahkan aksi ke button
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else if etalamat.text == "" {
            //kondisi ketika kosong
            //tampil alert dialog
            let alert = UIAlertController(title: "Warning", message: "Task Cannot Be Empty", preferredStyle: UIAlertControllerStyle.alert)
            //menambahkan aksi ke button
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else if etrate.text == "" {
            //kondisi ketika kosong
            //tampil alert dialog
            let alert = UIAlertController(title: "Warning", message: "Task Cannot Be Empty", preferredStyle: UIAlertControllerStyle.alert)
            //menambahkan aksi ke button
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else if etfasilitas.text == "" {
            //kondisi ketika kosong
            //tampil alert dialog
            let alert = UIAlertController(title: "Warning", message: "Task Cannot Be Empty", preferredStyle: UIAlertControllerStyle.alert)
            //menambahkan aksi ke button
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else if etlokasi.text == "" {
            //kondisi ketika kosong
            //tampil alert dialog
            let alert = UIAlertController(title: "Warning", message: "Task Cannot Be Empty", preferredStyle: UIAlertControllerStyle.alert)
            //menambahkan aksi ke button
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }else{
            //ketika kondisi tesk task nya tidak kosong
            //data di simpan ke core Data
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            _ = navigationController?.popViewController(animated: true)
            
            //mencetak kalau data berhasil ditambahkan
            print("Data berhasil disimpan")
            
            }
            }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
