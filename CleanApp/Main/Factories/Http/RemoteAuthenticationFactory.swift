//
//  UseCaseFactory.swift
//  Main
//
//  Created by Heitor Novais | Gerencianet on 17/06/21.
//

import Foundation
import Data
import Domain

func makeRemoteAuthentication() -> Authentication {
    return makeRemoteAuthenticationWith(httpClient: makeAlamofireAdapter())
}

func makeRemoteAuthenticationWith(httpClient: HttpPostClient) -> Authentication {
    let remoteAuthentication = RemoteAuthentication(url: makeApiUrl(path: "login"), httpClient: httpClient)
    return MainQueueDispatchDecortator(remoteAuthentication)
}
