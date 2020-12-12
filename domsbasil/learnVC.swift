//
//  learnVC.swift
//  domsbasil
//
//  Created by Dominic Caporuscio on 10/26/20.
//

import UIKit
import AVKit

class learnVC: UIViewController {
    
    var captureSession: AVCaptureSession!
    var stillImageOutput: AVCapturePhotoOutput!
    var videoPreviewLayer: AVCaptureVideoPreviewLayer!
    
    var label: UILabel!
    
    var grid:[UIView]!
    
    
    var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //view.backgroundColor = .orange
        print("learnVC")
        setupTitleLabel()
        setupCollectionView()

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        captureSession = AVCaptureSession()
        captureSession.sessionPreset = .medium
        //guard let frontCamera = AVCaptureDevice.default(for: AVMediaType.video)
        let deviceDiscoverySession = AVCaptureDevice.DiscoverySession(deviceTypes: [AVCaptureDevice.DeviceType.builtInDualCamera, AVCaptureDevice.DeviceType.builtInWideAngleCamera], mediaType: .video, position: .front)
        for device in deviceDiscoverySession.devices {
            if (device as AnyObject).position == AVCaptureDevice.Position.front{
                do {
                    let input = try AVCaptureDeviceInput(device: device)
                    stillImageOutput = AVCapturePhotoOutput()
                    if captureSession.canAddInput(input) && captureSession.canAddOutput(stillImageOutput) {
                        captureSession.addInput(input)
                        captureSession.addOutput(stillImageOutput)
                        setupLivePreview()
                    }
                }
                catch let error  {
                    print("Error Unable to initialize back camera:  \(error.localizedDescription)")
                }

            }
            
        }
        if collectionView != nil {
            self.view.bringSubviewToFront(collectionView)
        }
    }//viewDidAppear
    
    func setupLivePreview() {
        
        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        
        videoPreviewLayer.videoGravity = .resizeAspectFill
        videoPreviewLayer.connection?.videoOrientation = .portrait
        view.layer.addSublayer(videoPreviewLayer)
        
        //Step12
        DispatchQueue.global(qos: .userInitiated).async { //[weak self] in
            self.captureSession.startRunning()
            //Step 13
            DispatchQueue.main.async {
                self.videoPreviewLayer.frame = self.view.bounds
            }
        }
    }//setupLivePreview()

    
    func setupTitleLabel(){
        label = UILabel(frame: CGRect(x: view.frame.minX, y: view.frame.minY + 54, width: view.frame.width, height: 45))
        label.textAlignment = .center
        label.text = "Learn"
        self.view.addSubview(label)
        //label.backgroundColor = .red
        label.font = UIFont.boldSystemFont(ofSize: 25)
    }
    
    func setupCollectionView(){
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        layout.itemSize = CGSize(width: view.frame.width / 3, height: view.frame.height / 4)
        collectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        collectionView?.register(CustomCell.self, forCellWithReuseIdentifier: "MyCell")
        collectionView?.backgroundColor = UIColor.clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView ?? UICollectionView())
//        self.view = view
        collectionView?.dataSource = self
        collectionView?.delegate = self
        levels = [Int.random(in: 0...2), Int.random(in: 0...2), Int.random(in: 0...2)]
        updateTable()
    }
    
    func createGrid(){
        var arr = Array(repeating: Array(repeating: UIView(), count: 2), count: 3)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    var levels:[Int]!
    func updateTable(){
        levels[2] = levels[1]
        levels[1] = levels[0]
        levels[0] = Int.random(in: 0...2)
        collectionView.reloadData()
        print(levels)
    }

}

extension learnVC: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       print("User tapped on item \(indexPath.row)")
        updateTable()
    }
    
}

extension learnVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let nbCol = 3
        
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(nbCol - 1))
        let width = Int((collectionView.bounds.width - totalSpace) / CGFloat(nbCol))
        let height = Int((view.frame.height - totalSpace) / CGFloat(4))
        return CGSize(width: width, height: height)
    }
}

extension learnVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! CustomCell
        
        //myCell.backgroundColor = UIColor.white
        myCell.bg.image = nil
        myCell.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.25)
//
//        let rand = Int.random(in: 0...1)
//        if rand == 1 {
//            myCell.backgroundColor = .red
//        }
        
        if levels != nil {
            if indexPath.row < 3 {
                if indexPath.row % 3 == levels[0]{
                    //myCell.backgroundColor = .clear
                    myCell.bg.image = UIImage(named: "justbasil")
                }
            } else if indexPath.row < 6 {
                if indexPath.row % 3 == levels[1]{
                    //myCell.backgroundColor = .clear
                    myCell.bg.image = UIImage(named: "justbasil")
                }
            } else if indexPath.row < 9 {
                if indexPath.row % 3 == levels[2]{
                    //myCell.backgroundColor = .clear
                    myCell.bg.image = UIImage(named: "justbasil")
                }
            }
        }
        
        return myCell
    }
}
