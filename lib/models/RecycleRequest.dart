import 'package:e_recycle_mobile_app/models/Material.dart';

class RecycleRequest {

  Material _material = new Material("");
  double _quantity = 0;
  String _unit = "";
  String _location = "";
  String _dateSubmitted = "";
  String _status = "";


  RecycleRequest(Material material, double quantity, String unit, String location, String dateSubmitted, String status){
    this._material = material;
    this._quantity = quantity;
    this._unit = unit;
    this._location = location;
    this._dateSubmitted = dateSubmitted;
    this._status = status;

  }

  Material getMaterial() {
    return this._material;
  }

  double getQuantity() {
    return this._quantity;
  }

  String getUnit(){
    return this._unit;
  }

  String getLocation() {
    return this._unit;
  }

  String getDateSubmitted(){
    return this._dateSubmitted;
  }

  String getStatus() {
    return this._status;
  }


  void setMaterial(Material material){
    this._material = material;
  }

  void setQuantity(double quantity){
    this._quantity = quantity;
  }

  void setUnit(String unit){
    this._unit = unit;
  }

  void setLocation(String location){
    this._location = location;
  }

  void setDateSubmitted(String dateSubmitted){
    this._dateSubmitted = dateSubmitted;
  }

  void setStatus(String status){
    this._status = status;
  }

}