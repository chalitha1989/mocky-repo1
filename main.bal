import ballerina/http;

service / on new http:Listener(8080) {

    resource function get callMocky(http:Caller caller, http:Request req) returns error? {
        http:Client mockyClient = check new ("https://run.mocky.io");

        http:Response mockyResponse = check mockyClient->get("/v3/d6d031e8-9dc7-4862-9c63-53364cddc9fd");

        check caller->respond(mockyResponse);
    }
}
