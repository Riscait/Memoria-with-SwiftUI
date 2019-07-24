//
//  AnnivRepository.swift
//  Memoria
//
//  Created by 村松龍之介 on 2019/07/21.
//  Copyright © 2019 Ryunosuke Muramatsu. All rights reserved.
//

import Foundation
import Firebase

protocol AnnivRepository {
    func create(documentPath: String, anniversary: Anniversary, isMerge: Bool)
}

final class AnnivDataStore: AnnivRepository {
    
    private let db = Firestore.firestore()
    private let uid = Auth.auth().currentUser?.uid

    // MARK: - データ登録・更新
    
    /// Firestoreへのデータ登録・更新
    ///
    /// - Parameters:
    ///   - documentPath: 一意のID
    ///   - anniversary: 登録するデータ
    ///   - isMerge: 既存のドキュメントにデータを統合するか否か
    func create(documentPath: String, anniversary: Anniversary, isMerge: Bool) {
        
        let usersCollection = db.collection("user")
        let annivCollection = usersCollection.document(uid!).collection("anniv")
        
        annivCollection.document(documentPath)
            .setData(anniversary.toDictionary, merge: isMerge) { error in
                if let error = error {
                    Log.warn(error.localizedDescription)
                }
        }
    }

}
