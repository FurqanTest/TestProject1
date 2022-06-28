import Moya
import Alamofire
import UIKit

enum APIClient {
//    case Login(email:String,password:String)
//    case signup(name:String,email:String,password:String,is_social:Int,source:String)
//    case VerifyPin(email:String,otp:String)
//    case resend(email:String)
//    case resetpassword(email:String)
//    case changePassword(user_id:String,password:String)
//    case editprofile(email:String,name:String,password:String,picture:Data?)
//    case media(title:String,description:String,date:String,type:Int,user_id:String,feeling:Int)
//    case getMemories(id:String,from:String,to:String,type:String)
//    case uploadMedia(id:String,file:URL,thumb:Data?,type:String)
//    case removeMedia(id:String)
//    case editMedia(id:String,title:String,description:String,date:String,type:Int,feeling:Int)
//    case policies(pageid:Int)
//    case sendgift(memoryid:String,fromuser:String,toemail:String,title:String,description:String)
//    case subscriptions
//    case notifications
//    case invitePartner(email:String)
//    case removePartner(partner_id:Int,user_id:Int)
//    case addPartner(noti_id:String)
//    case subscribePackage(package_id:String,transaction_id:String)
//    case userrinfo
//    case getNotificationCount
//    case getGiftDetails(noti_id:Int)
//    case moveMedia(noti_id:Int)
//    case deleteMemory(id:Int)
//    case addToken(token:String)
    case testCall
}
extension APIClient: TargetType,AccessTokenAuthorizable{
    
    
    var authorizationType: AuthorizationType? {
        switch self {
        default:
            return .none
        }
    }
    
    var baseURL: URL {
        return URL(string: "https://reqres.in/api/users?page=2")!
    }
    
    var path: String {
        switch self {
//        case .moveMedia:
//            return "move-media"
//        case .getGiftDetails:
//            return "gift-detail"
//        case .getNotificationCount:
//            return "get-notifications-count"
//        case .Login:
//            return "login"
//        case .signup:
//            return "signup"
//        case .VerifyPin:
//            return "email_verification"
//        case .resend:
//            return "resend_otp"
//        case .resetpassword:
//            return "forget-password-otp"
//        case .changePassword:
//            return "reset_password"
//        case .editprofile:
//            return "edit_profile"
//        case .media:
//            return "media"
//        case .getMemories(let id,_,_,_):
//            return "media/\(id)"
//        case .uploadMedia(let id,_,_,_):
//            return "media/\(id)/add"
//        case .removeMedia(let id):
//            return "media/remove/\(id)"
//        case .editMedia(let id,_,_,_,_,_):
//            return "media/\(id)"
//        case .policies:
//            return "pages"
//        case .sendgift:
//            return "sendgift"
//        case .subscriptions:
//            return "subscriptions"
//        case .notifications:
//            return "get-notifications"
//        case .addPartner:
//            return "add-partner"
//        case .invitePartner:
//            return "invite-partner"
//        case .removePartner(_,_):
//            return "delete-partner"
//        case .subscribePackage:
//            return "subscribe-package"
//
//        case .userrinfo:
//            return "user-info"
//        case .deleteMemory(let id):
//            return "media/delete/\(id)"
//        case .addToken:
//            return "add-token"
        case .testCall:
            return ""
        }
    }
    
    var method: Moya.Method {
        return .get
        
//        switch self {
//        case .getMemories,.policies,.subscriptions:
//            return .get
//        default:
//            return .post
//        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
       return .requestPlain
        
//        switch self {
//        case .Login(let email,let password):
//            var param = [Moya.MultipartFormData]()
//            param.append(.init(provider: .data(email.data(using: .utf8)!), name: "email"))
//            param.append(.init(provider: .data(password.data(using: .utf8)!), name: "password"))
//            return .uploadMultipart(param)
//
//        case .signup(let name, let email, let password, let is_social,let source):
//            var param = [Moya.MultipartFormData]()
//            param.append(.init(provider: .data(name.data(using: .utf8)!), name: "name"))
//            param.append(.init(provider: .data(email.data(using: .utf8)!), name: "email"))
//            param.append(.init(provider: .data(password.data(using: .utf8)!), name: "password"))
//            param.append(.init(provider: .data(is_social.string.data(using: .utf8)!), name: "is_social"))
//            param.append(.init(provider: .data(source.data(using: .utf8)!), name: "source"))
//            return .uploadMultipart(param)
//        case .VerifyPin(let email, let otp):
//            return .requestParameters(parameters: ["email":email,"otp":otp], encoding: URLEncoding.queryString)
//
//        case .resend(let email),.resetpassword(let email):
//            return .requestParameters(parameters: ["email":email], encoding: URLEncoding.queryString)
//        case .changePassword(let user_id, let password):
//            var param = [Moya.MultipartFormData]()
//            param.append(.init(provider: .data(user_id.data(using: .utf8)!), name: "user_id"))
//            param.append(.init(provider: .data(password.data(using: .utf8)!), name: "password"))
//            return .uploadMultipart(param)
//        case .editprofile(let email, let name, let password,let picture):
//            var param = [Moya.MultipartFormData]()
//            param.append(.init(provider: .data(email.data(using: .utf8)!), name: "email"))
//            param.append(.init(provider: .data(name.data(using: .utf8)!), name: "name"))
//            param.append(.init(provider: .data(password.data(using: .utf8)!), name: "password"))
//            if let img = picture{
//                param.append(.init(provider: .data(img), name: "picture", fileName: "abc.jpg", mimeType: "image/jpg"))
//            }
//            return .uploadMultipart(param)
//
//        case .media(let title, let description, let date, let type, let user_id,let feeling):
//            return .requestParameters(parameters: ["title":title,"description":description,"date":date,"type":type,"user_id":user_id,"feeling":feeling], encoding: URLEncoding.queryString)
//        case .getMemories(_, let from, let to, let type):
//            var data = [String:Any]()
//            if from != ""{
//                data["from"] = from
//            }
//            if to != ""{
//                data["to"] = to
//            }
//            if type != ""{
//                data["type"] = type
//            }
//            return .requestParameters(parameters: data, encoding: URLEncoding.queryString)
//        case .editMedia(_,let title, let description, let date, let type,let feeling):
//            return .requestParameters(parameters: ["title":title,"description":description,"date":date,"type":type,"feeling":feeling], encoding: URLEncoding.queryString)
//        case .subscriptions:
//            return .requestPlain
//
//
//        case .uploadMedia(_, let file,let thumb,let type):
//            var param = [Moya.MultipartFormData]()
//
//
//
//            let data = try! Data.init(contentsOf: file)
//            param.append(.init(provider: .data(data), name: "object",fileName: type == "video/mp4" ? "abc.mp4" : "cdf.jpg",mimeType: type))
//            if let thumb = thumb{
//                param.append(.init(provider: .data(thumb), name: "thumbnail" ,fileName: "thumb.jpg",mimeType: "image/jpg"))
//            }
//            return .uploadMultipart(param)
//        case .removeMedia:
//            return .requestPlain
//        case .policies(let pageid):
//            return .requestParameters(parameters: ["pageid":pageid], encoding: URLEncoding.queryString)
//        case .sendgift(let memoryid, let fromuser, let toemail, let title, let description):
//            return .requestParameters(parameters: ["memoryid":memoryid,"fromuser":fromuser,"toemail":toemail,"title":title,"description":description], encoding: URLEncoding.queryString)
//        case .notifications:
//            return .requestParameters(parameters: ["email":DBManager.shared.getdata()?.email ?? ""], encoding: URLEncoding.queryString)
//        case .addPartner(let noti_id):
//            return .requestParameters(parameters: ["noti_id":noti_id], encoding: URLEncoding.queryString)
//        case .invitePartner(let email):
//            return .requestParameters(parameters: ["email":email,"userid":DBManager.shared.getUserID()], encoding: URLEncoding.queryString)
//        case .removePartner(let partner_id,let user_id):
//            return .requestParameters(parameters: ["partner_id":partner_id,"user_id":user_id], encoding: URLEncoding.queryString)
//        case .subscribePackage(let package_id,let transaction_id):
//            return .requestParameters(parameters: ["package_id":package_id,"user_id":DBManager.shared.getUserID(),"transaction_id":transaction_id], encoding: URLEncoding.queryString)
//        case .userrinfo:
//            var param = [Moya.MultipartFormData]()
//            param.append(.init(provider: .data(DBManager.shared.getUserID().data(using: .utf8)!), name: "userid"))
//
//            return .uploadMultipart(param)
//
//        case .getNotificationCount:
//            return .requestParameters(parameters: ["email":DBManager.shared.getdata()?.email ?? ""], encoding: URLEncoding.queryString)
//
//        case .getGiftDetails(let noti_id),.moveMedia(let noti_id):
//            return .requestParameters(parameters: ["noti_id":noti_id], encoding: URLEncoding.queryString)
//        case .deleteMemory:
//            return .requestPlain
//        case .addToken(let token):
//            var param = [Moya.MultipartFormData]()
//            param.append(.init(provider: .data(DBManager.shared.getUserID().data(using: .utf8)!), name: "userid"))
//            param.append(.init(provider: .data(token.data(using: .utf8)!), name: "token"))
//            return .uploadMultipart(param)
//
//        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return ["Content-Type":"application/json"]
        }
    }
    
    
}


class ApiController{
    
    static let shared = ApiController()
    private init(){}
    
    
    func makeNetworkCall(_ target: APIClient, _ error:@escaping (MoyaError)->Void,_ resultComp:@escaping (Response)->Void) {
        
      //  let token = DBManager.shared.getAuthToken().replacingOccurrences(of: "Bearer ", with: "")
        let authPlugin = AccessTokenPlugin { _ in "token" }
        
        let provider = MoyaProvider<APIClient>(plugins:[NetworkLoggerPlugin(configuration: .init(formatter: .init(), output: { target, items in
        }, logOptions: .verbose)),authPlugin])
        
        provider.request(target) { (result) in
            switch result {
            case .failure(let err):
                error(err)
            case .success(let resp):
              //  print("Request: ",resp.request)
               // print("Response: ",resp.response)
                resultComp(resp)
            }
        }
        
    }
    
    //JsonData Formatting
    public func JSONResponseDataFormatter(_ data: Data) -> Data{
        
        do{
            let dataAsJson = try JSONSerialization.jsonObject(with: data)
            let prettyData = try JSONSerialization.data(withJSONObject: dataAsJson, options: .prettyPrinted)
            return prettyData
        }
        catch
        {
            return data
            
        }
    }
}
