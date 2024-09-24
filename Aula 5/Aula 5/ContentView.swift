//
//  ContentView.swift
//  Aula 5
//
//  Created by Turma01-3 on 24/09/24.
//

import SwiftUI


struct Song:Identifiable{
    var id: Int
    var name: String
    var artist: String
    var capa: String
    
}
struct Album: Identifiable {
    var id: Int
    var name: String
    var artist: String
    var capa: String
}

var arrayMusicas = [
   Song(id: 4, name:"Numb Encore", artist:"Linkin Park", capa:"lpCollisionCourse"),
   Song(id: 5, name:"Lost On You", artist:"Linkin Park", capa:"lpLOST"),
   Song(id: 6, name:"In the End", artist:"Linkin Park", capa:"lpHybridTheory"),
   Song(id: 7, name:"Crawling", artist:"Linkin Park", capa:"lpHybridTheory"),
   Song(id: 8, name:"Breaking the Habit", artist:"Linkin Park", capa:"lpMeteora"),
   Song(id: 9, name:"Faint", artist:"Linkin Park", capa:"lpMeteora"),
   Song(id: 10, name:"One Step Closer", artist:"Linkin Park", capa:"lpHybridTheory"),
   Song(id: 11, name:"Somewhere I Belong", artist:"Linkin Park", capa:"lpMeteora"),
   Song(id: 12, name:"What I've Done", artist:"Linkin Park", capa:"lpMinutesToMidnight"),
   Song(id: 13, name:"New Divide", artist:"Linkin Park", capa:"lpTransformersRevenge"),
   Song(id: 14, name:"Castle of Glass", artist:"Linkin Park", capa:"lpLivingThings"),
   Song(id: 15, name:"Burn It Down", artist:"Linkin Park", capa:"lpLivingThings")
]
let similarAlbums = [
    Album(id: 1, name: "Hybrid Theory", artist: "Linkin Park", capa: "lpHybridTheory"),
    Album(id: 2, name: "Meteora", artist: "Linkin Park", capa: "lpMeteora"),
    Album(id: 3, name: "Minutes to Midnight", artist: "Linkin Park", capa: "lpMinutesToMidnight"),
    Album(id: 4, name: "Toxicity", artist: "System of a Down", capa: "toxicityCover"),
    Album(id: 5, name: "The Sickness", artist: "Disturbed", capa: "theSicknessCover"),
    Album(id: 6, name: "Fallen", artist: "Evanescence", capa: "fallenCover"),
    Album(id: 7, name: "The End of Heartache", artist: "Killswitch Engage", capa: "theEndOfHeartacheCover")
]



struct songCard: View {
    @State var name: String
    @State var artist: String
    @State var capa: String
    var body: some View {
        HStack{
            HStack{
                Image(capa).resizable().scaledToFit().frame(maxWidth: 60)
                VStack(alignment:.leading){
                    Text(name).font(.headline).foregroundColor(.white)
                    Text(artist).font(.subheadline).foregroundColor(.white)
                }
            }
            Spacer()
            Image(systemName: "ellipsis").foregroundColor(.white)
        }
    }
}
struct songDetail: View {
    @State var name: String
    @State var artist: String
    @State var capa: String
    
    @State private var isPlaying = false
    @State private var progress: Double = 0.0
    @State private var timer: Timer?
    
    func formatTime(seconds: Double) -> String {
          let minutes = Int(seconds) / 60
          let seconds = Int(seconds) % 60
          return String(format: "%02d:%02d", minutes, seconds)
      }
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.green, .black]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                // Album Image
                Image(capa)
                    .resizable()
                    .scaledToFit()
                    .frame(maxWidth: 300, maxHeight: 300)
                
                // Song Name and Artist
                VStack {
                    Text(name)
                        .font(.title)
                        .bold()
                        .foregroundColor(.white)
                    Text(artist)
                        .font(.headline)
                        .foregroundColor(.white)
                }
                
                Spacer()
                
                // Progress Bar (Slider)
                VStack {
                    Slider(value: $progress, in: 0...225)
                        .accentColor(.white)
                    HStack {
                        Text(formatTime(seconds: progress))
                            .foregroundColor(.white)
                        Spacer()
                        Text("3:45") // Example duration
                            .foregroundColor(.white)
                    }
                }.padding(.horizontal)
                
                Spacer()
                
                // Control Buttons
                HStack {
                    Spacer()
                    Image(systemName: "shuffle")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.white)
                        .frame(maxWidth: 30)
                    Spacer()
                    Image(systemName: "backward.end.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.white)
                        .frame(maxWidth: 30)
                    Spacer()
                    // Play/Pause Button
                    Button(action: {
                        isPlaying.toggle()
                        if isPlaying {
                            startTimer()
                        } else {
                            stopTimer()
                        }
                    }) {
                        Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.white)
                            .frame(maxWidth: 30)
                    }
                    Spacer()
                    Image(systemName: "forward.end.fill")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.white)
                        .frame(maxWidth: 30)
                    Spacer()
                    Image(systemName: "repeat")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.white)
                        .frame(maxWidth: 30)
                    Spacer()
                }
                
                Spacer()
            }
        }
    }
    
    // Timer logic to update the progress
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
            if progress < 100 {
                progress += 0.1 // Adjust the speed of progress
            } else {
                stopTimer()
            }
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}
struct AlbumCard:View {
    var body: some View {
        VStack{
            Image("lplogo").resizable()
            Text("Linkin Park FM")
        }
    }
}


struct ContentView: View {
    var body: some View {
        NavigationStack{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [Color.blue, .black]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                ScrollView {
                   
                        Image("lplogo").resizable().scaledToFit().frame(maxWidth: 270).padding()
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Linkin Park FM")
                                .font(.title)
                                .bold()
                                .foregroundColor(.white)
                                .multilineTextAlignment(.leading)
                            
                            HStack {
                                Image("me")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(maxWidth: 20)
                                
                                Text("Alysson")
                                    .font(.subheadline)
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.leading)
                            }.padding(.bottom)
                        }
                        Spacer() // Mantém o espaçamento do HStack geral
                    }
                

                    ForEach(arrayMusicas){ song in
                        NavigationLink(destination: songDetail(name: song.name, artist: song.artist, capa: song.capa)){
                            songCard(name: song.name,artist: song.artist,capa: song.capa)
                        }
                        
                    }
                    HStack{
                        Text("Sugestões").font(.title)
                            .foregroundColor(.white)
                        Spacer()
                    }.frame(alignment:.leading).padding(.top)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 20) {
                            ForEach(similarAlbums) { album in
                                VStack {
                                    // Exibe a capa do álbum
                                    Image(album.capa)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 150, height: 150)
                                        .cornerRadius(8)
                                    
                                    // Exibe o nome do álbum
                                    Text(album.name)
                                        .font(.headline)
                                        .foregroundColor(.white)
                                        .frame(width: 150)
                                        .multilineTextAlignment(.center)
                                }
                            }
                        }
                        .padding(.bottom)
                    }
                    
                }.padding()
            }
            
        }.accentColor(.white)
    }
}

#Preview {
    ContentView()
}
