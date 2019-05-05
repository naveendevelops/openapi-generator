{-
   OpenAPI Petstore
   This is a sample server Petstore server. For this sample, you can use the api key `special-key` to test the authorization filters.

   OpenAPI spec version: 1.0.0

   NOTE: This file is auto generated by the openapi-generator.
   https://github.com/openapitools/openapi-generator.git
   Do not edit this file manually.
-}


module Request.Pet exposing (addPet, deletePet, findPetsByStatus, findPetsByTags, getPetById, updatePet, updatePetWithForm, uploadFile)

import Data.Pet as Pet exposing (Pet)
import Data.ApiResponse as ApiResponse exposing (ApiResponse)
import Dict
import Http
import Json.Decode as Decode
import Url.Builder as Url


basePath : String
basePath =
    "http://petstore.swagger.io/v2"


addPet :
    { onSend : Result Http.Error () -> msg


    , body : Pet


    }
    -> Cmd msg
addPet params =
    Http.request
        { method = "POST"
        , headers = []
        , url = Url.crossOrigin basePath
            ["pet"]
            []
        , body = Http.jsonBody <| Pet.encode params.body
        , expect = Http.expectWhatever params.onSend
        , timeout = Just 30000
        , tracker = Nothing
        }


deletePet :
    { apiKey : Maybe (String)
    } -> 
    { onSend : Result Http.Error () -> msg



    , petId : Int

    }
    -> Cmd msg
deletePet headers params =
    Http.request
        { method = "DELETE"
        , headers = List.filterMap identity [Maybe.map (Http.header "api_key" ) headers.apiKey]
        , url = Url.crossOrigin basePath
            ["pet",  String.fromInt params.petId]
            []
        , body = Http.emptyBody
        , expect = Http.expectWhatever params.onSend
        , timeout = Just 30000
        , tracker = Nothing
        }


{-| Multiple status values can be provided with comma separated strings
-}
findPetsByStatus :
    { onSend : Result Http.Error (List Pet) -> msg




    , status : List String
    }
    -> Cmd msg
findPetsByStatus params =
    Http.request
        { method = "GET"
        , headers = []
        , url = Url.crossOrigin basePath
            ["pet", "findByStatus"]
            (List.filterMap identity [Just (Url.string "status" <| String.join "," params.status)])
        , body = Http.emptyBody
        , expect = Http.expectJson params.onSend (Decode.list Pet.decoder)
        , timeout = Just 30000
        , tracker = Nothing
        }


{-| Multiple tags can be provided with comma separated strings. Use tag1, tag2, tag3 for testing.
-}
findPetsByTags :
    { onSend : Result Http.Error (List Pet) -> msg




    , tags : List String
    }
    -> Cmd msg
findPetsByTags params =
    Http.request
        { method = "GET"
        , headers = []
        , url = Url.crossOrigin basePath
            ["pet", "findByTags"]
            (List.filterMap identity [Just (Url.string "tags" <| String.join "," params.tags)])
        , body = Http.emptyBody
        , expect = Http.expectJson params.onSend (Decode.list Pet.decoder)
        , timeout = Just 30000
        , tracker = Nothing
        }


{-| Returns a single pet
-}
getPetById :
    { onSend : Result Http.Error Pet -> msg



    , petId : Int

    }
    -> Cmd msg
getPetById params =
    Http.request
        { method = "GET"
        , headers = []
        , url = Url.crossOrigin basePath
            ["pet",  String.fromInt params.petId]
            []
        , body = Http.emptyBody
        , expect = Http.expectJson params.onSend Pet.decoder
        , timeout = Just 30000
        , tracker = Nothing
        }


updatePet :
    { onSend : Result Http.Error () -> msg


    , body : Pet


    }
    -> Cmd msg
updatePet params =
    Http.request
        { method = "PUT"
        , headers = []
        , url = Url.crossOrigin basePath
            ["pet"]
            []
        , body = Http.jsonBody <| Pet.encode params.body
        , expect = Http.expectWhatever params.onSend
        , timeout = Just 30000
        , tracker = Nothing
        }


updatePetWithForm :
    { onSend : Result Http.Error () -> msg



    , petId : Int

    }
    -> Cmd msg
updatePetWithForm params =
    Http.request
        { method = "POST"
        , headers = []
        , url = Url.crossOrigin basePath
            ["pet",  String.fromInt params.petId]
            []
        , body = Http.emptyBody
        , expect = Http.expectWhatever params.onSend
        , timeout = Just 30000
        , tracker = Nothing
        }


uploadFile :
    { onSend : Result Http.Error ApiResponse -> msg



    , petId : Int

    }
    -> Cmd msg
uploadFile params =
    Http.request
        { method = "POST"
        , headers = []
        , url = Url.crossOrigin basePath
            ["pet",  String.fromInt params.petId, "uploadImage"]
            []
        , body = Http.emptyBody
        , expect = Http.expectJson params.onSend ApiResponse.decoder
        , timeout = Just 30000
        , tracker = Nothing
        }
