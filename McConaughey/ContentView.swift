//
//  ContentView.swift
//  McConaughey
//
//  Created by Bob Witmer on 2023-07-12.
//

import SwiftUI
import AVFAudio

struct ContentView: View {
    let titleMessage = "How is Matt?"
    let alrightMessage = "How Alright is Matt?"
    @State private var alrightValue = 3
    @State private var audioPlayer: AVAudioPlayer!
    
    var body: some View {
        
        VStack {
            Text(titleMessage)
                .font(.largeTitle)
                .fontWeight(.black)
            Image("matt")
                .resizable()
                .scaledToFit()
                .cornerRadius(30)
                .shadow(radius: 10)
                .padding(
                )
            
            HStack {
                //                Text(alrightMessage)
                //                    .font(.title2)
                

            Stepper(alrightMessage, value: $alrightValue, in: 0...10)
                    .font(.title2)
                
                
            }
            .padding()
            
            Text("\(alrightValue)")
                .font(.largeTitle)
            
            Spacer()
            
            Button("Tell Me!") {
                playSound(soundName: "alright")
            }
            .buttonStyle(.bordered)
            .bold()
            .accentColor(.accentColor)

        }
        .padding()
        

    }
    
    // Function to Play a sound
    // Requires:    import AVFAudio
    //              @State private var audioPlayer: AVAudioPlayer!
    func playSound(soundName: String) {
        guard let soundFile = NSDataAsset(name: soundName) else {
            print("😡 Could not read file named \(soundName).")
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            if alrightValue != 0 {
                audioPlayer.numberOfLoops = alrightValue - 1
                audioPlayer.play()
            }

        } catch {
            print("😡 ERROR: \(error.localizedDescription) creating audioPlayer.")
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}

