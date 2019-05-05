{-
   OpenAPI Petstore
   This is a sample server Petstore server. For this sample, you can use the api key `special-key` to test the authorization filters.

   OpenAPI spec version: 1.0.0

   NOTE: This file is auto generated by the openapi-generator.
   https://github.com/openapitools/openapi-generator.git
   Do not edit this file manually.
-}


module Request.User exposing (createUser, createUsersWithArrayInput, createUsersWithListInput, deleteUser, getUserByName, loginUser, logoutUser, updateUser)

import Data.User as User exposing (User)
import Dict
import Http
import Json.Decode as Decode


basePath : String
basePath =
    "http://petstore.swagger.io/v2"


{-| This can only be done by the logged in user.
-}
createUser : User -> Http.Request ()
createUser model =
    { method = "POST"
    , url = basePath ++ "/user"
    , headers = []
    , body = Http.jsonBody <| User.encode model
    , expect = Http.expectStringResponse (\_ -> Ok ())
    , timeout = Just 30000
    , withCredentials = False
    }
        |> Http.request


createUsersWithArrayInput : User -> Http.Request ()
createUsersWithArrayInput model =
    { method = "POST"
    , url = basePath ++ "/user/createWithArray"
    , headers = []
    , body = Http.jsonBody <| User.encode model
    , expect = Http.expectStringResponse (\_ -> Ok ())
    , timeout = Just 30000
    , withCredentials = False
    }
        |> Http.request


createUsersWithListInput : User -> Http.Request ()
createUsersWithListInput model =
    { method = "POST"
    , url = basePath ++ "/user/createWithList"
    , headers = []
    , body = Http.jsonBody <| User.encode model
    , expect = Http.expectStringResponse (\_ -> Ok ())
    , timeout = Just 30000
    , withCredentials = False
    }
        |> Http.request


{-| This can only be done by the logged in user.
-}
deleteUser : String -> Http.Request ()
deleteUser username =
    { method = "DELETE"
    , url = basePath ++ "/user/" ++   username
    , headers = []
    , body = Http.emptyBody
    , expect = Http.expectStringResponse (\_ -> Ok ())
    , timeout = Just 30000
    , withCredentials = False
    }
        |> Http.request


getUserByName : String -> Http.Request User
getUserByName username =
    { method = "GET"
    , url = basePath ++ "/user/" ++   username
    , headers = []
    , body = Http.emptyBody
    , expect = Http.expectJson User.decoder
    , timeout = Just 30000
    , withCredentials = False
    }
        |> Http.request


loginUser : Http.Request String
loginUser =
    { method = "GET"
    , url = basePath ++ "/user/login"
    , headers = []
    , body = Http.emptyBody
    , expect = Http.expectJson Decode.string
    , timeout = Just 30000
    , withCredentials = False
    }
        |> Http.request


logoutUser : Http.Request ()
logoutUser =
    { method = "GET"
    , url = basePath ++ "/user/logout"
    , headers = []
    , body = Http.emptyBody
    , expect = Http.expectStringResponse (\_ -> Ok ())
    , timeout = Just 30000
    , withCredentials = False
    }
        |> Http.request


{-| This can only be done by the logged in user.
-}
updateUser : String -> User -> Http.Request ()
updateUser username model =
    { method = "PUT"
    , url = basePath ++ "/user/" ++   username
    , headers = []
    , body = Http.jsonBody <| User.encode model
    , expect = Http.expectStringResponse (\_ -> Ok ())
    , timeout = Just 30000
    , withCredentials = False
    }
        |> Http.request
