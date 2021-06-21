//
//  UseCaseFactory.swift
//  Main
//
//  Created by Heitor Novais | Gerencianet on 17/06/21.
//

import Foundation
import Data
import Domain

func makeRemoteAddAccount() -> AddAccount {
    return makeRemoteAddAccountWith(httpClient: makeAlamofireAdapter())
}

func makeRemoteAddAccountWith(httpClient: HttpPostClient) -> AddAccount {
    let remoteAddAccount = RemoteAddAccount(url: makeApiUrl(path: "signup"), httpClient: httpClient)
    return MainQueueDispatchDecortator(remoteAddAccount)
}
