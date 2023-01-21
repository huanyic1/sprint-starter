//
//  ContentView.swift
//  sprint-timer Watch App
//
//  Created by Yicheng Huang on 1/15/23.
//

import SwiftUI
import Foundation
import AVFoundation

class AudioTest {
    
    var sound = AVAudioPlayer()
    
    func testMP3() -> Void {
        
        let bundle = Bundle.main
        
        let url = bundle.url(forResource: "louderGun", withExtension: "mp3")
        if let u = url {
            
            do {
                do {
                       
                        try AVAudioSession.sharedInstance().setCategory(.playback, mode: .moviePlayback, options: .duckOthers)
                        
                    } catch let error as NSError {
                        print(error)
                        
                }
                sound = try AVAudioPlayer(contentsOf: u, fileTypeHint: AVFileType.mp3.rawValue)
                sound.prepareToPlay()
                sound.play()
            } catch let error {
                print(error.localizedDescription)
            }
            
        } else {
            print("Could not find resource!")
        }
        
    }
}




struct ContentView: View {
    @State var startTime: Date? = nil
    @State var timeDelta: Double = 0
    @State var timerRunning = false
    @State var reset = true
    @State var starting = false
    @State var finalTime: Date? = nil
    @State var c = Color.black
    
    var s = AudioTest()
    
    let timer = Timer.publish(every: 0.01, on: .main, in: .common).autoconnect()

    var body: some View{
        if (!timerRunning && reset){
            HStack(alignment: .top, spacing: 5){
                Button("Start"){
                    s.testMP3()
                    sleep(4)
                    timerRunning = true
                    reset = false
                    
                    startTime = Date()
                    
                }.foregroundColor(.green).font(.system(size:40))
            }
        }
        else{
            if timerRunning{
                
                ZStack{
                    //                    Text(String(format: "%.2f", timeDelta)).onReceive(timer) { _ in
//                        if timerRunning{
//                            timeDelta = Date().timeIntervalSince(startTime!)
//                        }
//                    }.font(.system(size: 80, weight: .bold)).opacity(0.80)
                    Text("").onReceive(timer){ _ in
                        timeDelta = Date().timeIntervalSince(startTime!)
                    }
                    Color.black.ignoresSafeArea(.all)
                    
//                    Button(String(format: "%.2f", timeDelta)){
//                        finalTime = Date()
//                        timerRunning = false
//                    }.foregroundColor(.red).font(.system(size:40)).frame(maxWidth: .infinity, maxHeight: .infinity)
                    //eventually make entire screen button
                    Button(action: { // Note: no initializer parameter
                        finalTime = Date()
                        timerRunning = false
                    }, label: { Text(String(format: "%.2f", timeDelta)).edgesIgnoringSafeArea(.all).frame(maxWidth: .infinity, maxHeight: .infinity).background(c.opacity(100)).foregroundColor(Color.red).font(.system(size:60, weight: .bold)) })
                    .background(Color.black).tint(.black).ignoresSafeArea(.all).frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                }.background(c)
            }
            else{
                VStack{
                    Text(String(format: "%.2f", finalTime!.timeIntervalSince(startTime!)))
                    .font(.system(size: 60, weight: .bold)).opacity(0.80)
                    
                    Button("Reset"){
                        reset = true
                    }.foregroundColor(.red).font(.system(size:40)) //eventually make entire screen button
                }
                
            }
                
        }
        
        
        
        
    }
        
    
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
