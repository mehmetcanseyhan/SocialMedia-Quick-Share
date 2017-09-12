//
//  ViewController.swift
//  facebook
//
//  Created by Flyco Developer on 23/08/2017.
//  Copyright © 2017 Flyco Developer. All rights reserved.
//

import UIKit
import Social
import MessageUI

class ViewController: UIViewController, MFMessageComposeViewControllerDelegate, MFMailComposeViewControllerDelegate{
    
    @IBOutlet weak var resimTasiyici: UIImageView!
    @IBOutlet weak var textAlani: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func gonderAction(_ sender: Any) {
        
        if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeFacebook){
        
        let taslak:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeFacebook)
        
            
        taslak.setInitialText(textAlani.text)
        taslak.add(resimTasiyici.image)
        
        self.present(taslak, animated: true, completion: nil)
        }else{
        
            let uyari:UIAlertController = UIAlertController(title: "Kayıtlı Facebook Hesabı Bulunamadı", message: "Lütfen Cihazınızın Ayarlar Menüsünden Facebooka Giriş Yapınız", preferredStyle: UIAlertControllerStyle.alert)
            let tamamDugmesi:UIAlertAction = UIAlertAction(title: "Tamam", style: UIAlertActionStyle.default, handler: nil)
            
            uyari.addAction(tamamDugmesi)
            self.present(uyari, animated: true, completion: nil)
        
        }
    }
    @IBAction func twitteraGonder(_ sender: Any) {
        
        if SLComposeViewController.isAvailable(forServiceType: SLServiceTypeTwitter){
        
            let Taslak:SLComposeViewController = SLComposeViewController(forServiceType: SLServiceTypeTwitter)
            Taslak.setInitialText(textAlani.text)
            Taslak.add(resimTasiyici.image)
            self.present(Taslak, animated: true, completion: nil)
            
        }else {
        
            let Uyari:UIAlertController = UIAlertController(title: "Kayıtlı Twitter Hesabı Bulunamadı", message: "Lütfen Cihazınızın Ayarlar Menüsünden Twitter'a Giriş Yapınız", preferredStyle: UIAlertControllerStyle.alert)
            let TamaDugmesi:UIAlertAction = UIAlertAction(title: "Tamam", style: UIAlertActionStyle.default, handler: nil)
            
            Uyari.addAction(TamaDugmesi)
            self.present(Uyari, animated: true, completion: nil)
        }
        
        
    }
    
    @IBAction func smsGonder(_ sender: Any) {
    
    let taslagim = MFMessageComposeViewController()
        taslagim.recipients = ["05393242319","05317833204"]
        taslagim.body = textAlani.text
        taslagim.messageComposeDelegate = self
        self.present(taslagim, animated: true, completion: nil)
    
    
    }
        
        func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult){
            switch (result.rawValue) {
            case MessageComposeResult.cancelled.rawValue:
                let Uyarim:UIAlertController = UIAlertController(title: "SMS Gönderim", message: "İptal Edildi", preferredStyle: UIAlertControllerStyle.alert)
                let tamamDugme:UIAlertAction = UIAlertAction(title: "Tamam", style: UIAlertActionStyle.default, handler: nil)
                Uyarim.addAction(tamamDugme)
                self.present(Uyarim, animated: true, completion: nil)
                break
            case MessageComposeResult.failed.rawValue:
                let Uyarim:UIAlertController = UIAlertController(title: "SMS Gonderim", message: "Başarısız", preferredStyle: UIAlertControllerStyle.alert)
                let tamamDugme:UIAlertAction = UIAlertAction(title: "Tamam", style: UIAlertActionStyle.default, handler: nil)
                Uyarim.addAction(tamamDugme)
                self.present(Uyarim, animated: true, completion: nil)
                break
            case MessageComposeResult.sent.rawValue:
                let Uyarim:UIAlertController = UIAlertController(title: "SMS Gonderim", message: "Başarılı", preferredStyle: UIAlertControllerStyle.alert)
                let tamamDugme:UIAlertAction = UIAlertAction(title: "Tamam", style: UIAlertActionStyle.default, handler: nil)
                Uyarim.addAction(tamamDugme)
                self.present(Uyarim, animated: true, completion: nil)
                break
            default:
            break
            
        
        }
        
    
        
    }
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        switch (result.rawValue) {
        case MFMailComposeResult.cancelled.rawValue:
            let uyar:UIAlertController = UIAlertController(title: "Mail Gönderim", message: "İptal Edildi", preferredStyle: UIAlertControllerStyle.alert)
            let tamamdir:UIAlertAction = UIAlertAction(title: "Tamam", style: UIAlertActionStyle.default, handler: nil)
            uyar.addAction(tamamdir)
            self.present(uyar, animated: true, completion: nil)
        break
        case MFMailComposeResult.failed.rawValue:
            let uyar:UIAlertController = UIAlertController(title: "Mail Gönderim", message: "Başarısız", preferredStyle: UIAlertControllerStyle.alert)
            let tamamdir:UIAlertAction = UIAlertAction(title: "Tamam", style: UIAlertActionStyle.default, handler: nil)
            uyar.addAction(tamamdir)
            self.present(uyar, animated: true, completion: nil)
            break
        case MFMailComposeResult.saved.rawValue:
            let uyar:UIAlertController = UIAlertController(title: "Mail Gönderim", message: "Kayıt Edildi", preferredStyle: UIAlertControllerStyle.alert)
            let tamamdir:UIAlertAction = UIAlertAction(title: "Tamam", style: UIAlertActionStyle.default, handler: nil)
            uyar.addAction(tamamdir)
            self.present(uyar, animated: true, completion: nil)
            break
        case MFMailComposeResult.sent.rawValue:
            let uyar:UIAlertController = UIAlertController(title: "Mail Gönderim", message: "Başarılı", preferredStyle: UIAlertControllerStyle.alert)
            let tamamdir:UIAlertAction = UIAlertAction(title: "Tamam", style: UIAlertActionStyle.default, handler: nil)
            uyar.addAction(tamamdir)
            self.present(uyar, animated: true, completion: nil)
            break
        default:
            break
        }
    }
    
    @IBAction func emailGonder(_ sender: Any) {
        
        let resim = UIImage(named: "resim1.png")
        let resimVerisi = UIImagePNGRepresentation(resim!)
        
        let emailTaslagi:MFMailComposeViewController = MFMailComposeViewController()
        emailTaslagi.setMessageBody(textAlani.text!, isHTML: false)
        emailTaslagi.setSubject("Önemli")
        emailTaslagi.setToRecipients(["mcseyhan4@gmail.com","mcseyhan@yandex.com","13541515.mehmetcan.seyhan@gmail.com","mehmetca.seyhan@flycoglobal.com"])
        
        emailTaslagi.addAttachmentData(resimVerisi!, mimeType: "image/png", fileName: "resimim.png")
        emailTaslagi.mailComposeDelegate = self
        
        
        self.present(emailTaslagi, animated: true, completion: nil)
        
        
        
    }

}

