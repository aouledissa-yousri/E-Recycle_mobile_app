
import 'dart:convert';
import '../Hosts.dart';
import '../display/items/MaterialItem.dart';
import '../models/Citizen.dart';
import '../models/RecycleRequest.dart';
import 'package:http/http.dart' as http;



abstract class RecycleRequestManagementService {

   static Future<http.Response> getMaterials() async {
    return await http.get(Uri.parse(Hosts.gatewayUrl+"/getMaterials"), headers: {"Content-type": "application/json"});
  } 


  static Future<http.Response> makeRecycleRequest(RecycleRequest recycleRequest, String token) async {
    return await http.post(Uri.parse(Hosts.gatewayUrl+"/makeRecycleRequest"), headers: {"Content-type": "application/json", "Token" : token}, body: json.encode(recycleRequest.getData()));
  }

  static void withdrawRecycleRequest(RecycleRequest recycleRequest, String token) {
  }

  static void validateRecyckeRequest(RecycleRequest recycleRequest, String token) {
  }

  static void completeRecycleRequest(RecycleRequest recycleRequest, String token) {
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