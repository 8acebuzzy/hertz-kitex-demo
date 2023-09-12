namespace go demouser
enum ErrCode{
    SuccessCode =0
    ServiceErrCode =100001
    ParamErrcode =100002
    UserAlreadyExistErrCode =100003
    AuthorizationFailedErrCode =1000004
}

struct BaseResp{
    1:i64 status_code
    2:string status_message
    3:i64 service_time
}
struct User{
    1:i64 user_id
    2:string username
    3:string avator
}
struct CreateUserRequest{
    1:string username (vt.min_size="1")
    2:string password (vt.min_size="1")
}
struct CreateUserResponse{
    1:BaseResp base_resp
}
struct MGetUserRequest{
    1:list<i64> user_ids(vt.min_size="1")
}
struct MGetUserResponse{
    1:list<i64>user_ids(vt.min_size="1")
    2:BaseResp base_resp
}
struct CheckUserRequest{
    1:string username (vt.min_size="1")
    2:string password (vt.min_size="1")
}
struct CheckUserResponse{
    1:i64 user_id
    2:BaseResp base_resp
}
service UserService{
    CreateUserResponse CreateUser(1:CheckUserRequest req)
    MGetUserResponse MGetUser(1:MGetUserRequest req)
    CheckUserResponse CheckUser(1:CheckUserRequest req)
}
