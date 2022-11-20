import '../display/alertBoxes/ResultAlertBox.dart';
import '../models/RecycleRequest.dart';


abstract class RecycleRequestManagementService {


  static ResultAlertBox makeRecycleRequest(RecycleRequest recycleRequest, String token) {
    return ResultAlertBox();
  }

  static ResultAlertBox withdrawRecycleRequest(RecycleRequest recycleRequest, String token) {
    return ResultAlertBox();
  }

  static ResultAlertBox validateRecyckeRequest(RecycleRequest recycleRequest, String token) {
    return ResultAlertBox();
  }

  static ResultAlertBox completeRecycleRequest(RecycleRequest recycleRequest, String token) {
    return ResultAlertBox();
  }

  
  //the recycle requests that the citizen made
  static List<RecycleRequest> getRecycleRequestsMade(RecycleRequest recycleRequest, String token) {
    return <RecycleRequest>[];
  }

  //all recycle requests made that are pending
  static List<RecycleRequest> getAllRecycleRequests(RecycleRequest recycleRequest, String token) {
    return <RecycleRequest>[];
  }

  //all recycle requests validate by a collector 
  static List<RecycleRequest> getAllValidatedRecycleRequests(RecycleRequest recycleRequest, String token) {
    return <RecycleRequest>[];
  }

}