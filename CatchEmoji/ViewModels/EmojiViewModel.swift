//
//  EmojiViewModel.swift
//  CatchEmoji
//
//  Created by Anna Ershova on 09.08.2022.
//

import Foundation
import Network
import Data

final class EmojiViewModel: ObservableObject {
    @Injected var network: NetworkService?
    @Injected var data: DataService?
    @Published var allEmojies: [Emoji]?

    private let url = URL(stringLiteral: "https://emojihub.herokuapp.com/api/all")
    
    private func fetchRequest() {
        Task.detached(priority: .utility) { [self] in
            do {
                let result = try await self.network?.request(type: [Emoji].self, url: self.url)
                await MainActor.run {
                    self.allEmojies = result
                    addEmojiesToData(newData: result)
                }
            }
            catch {
                await MainActor.run {
                    print("some error after parsing")
                }
            }
        }
    }
    
    private func addEmojiesToData(newData: [Emoji]?) {
        let entities = Entity(context: (data?.context)!)
        entities.emojies = data?.encodeData(type: [Emoji].self, withData: newData)
        data?.saveData()
        print("emojies added", newData as Any)
    }
    
    func getEmojiesFromData() {
        let requests = Entity.fetchRequest()
        var mapped: [Emoji]?
        do {
            let emjs = try data?.context?.fetch(requests) ?? []
            for i in emjs {
                let dec = data?.decodeData(type: [Emoji].self, withData: i.emojies)
                mapped = dec
                print("decode Emojies from core data")
            }
        }
        catch {
            print("error getting emojies")
        }
        data?.saveData()
        self.allEmojies = mapped
    }
        
    func prepareData() {
        if let res = data?.checkIfDataIsEmpty(name: "Entity") {
            if res {
                print("network service is about to start working")
                fetchRequest()
            }
            else {
                print("load data from storage")
                getEmojiesFromData()
            }
        }
    }
    
    func cleanEmojies() {
        allEmojies = []
    }
    
}
