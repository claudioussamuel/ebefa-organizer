class TickectModel {
  static const ID = "id";
  static const NAME = "name";
  static const START_TIME = "start-time";
  static const END_TIME = "end-time";
  static const PICTURE = "picture";
  static const DESCRIPTION = "description";
  static const LOCATION = "location";
  static const CITY = "city";
  static const PRICE = "price";
  static const DATE = "date";
  static const CART = "cart";
  static const ADMINID = 'adminId';
  static const PATH = "path";
  static const BUSINESS_NAME = "business-name";
  static const BANK = "bank";
  static const ACCOUNT = "account";
  static const SUBACCOUNTNUMBER = 'sub-account-number';

  final String? id;
  final String? name;
  final String? startTime;
  final String? endTime;
  final String? picture;
  final String? description;
  final String? city;
  final double? price;
  final String? location;
  final String? date;
  final String? path;
  final String? subAccountNumber;

  final String? adminId;
  TickectModel({
    this.id,
    this.name,
    this.startTime,
    this.endTime,
    this.picture,
    this.description,
    this.city,
    this.price,
    this.location,
    this.date,
    this.path,
    this.adminId,
    this.subAccountNumber,
  });

  factory TickectModel.fromJson(Map<String, dynamic> json) {
    return TickectModel(
      id: json[ID],
      name: json[NAME],
      startTime: json[START_TIME],
      endTime: json[END_TIME],
      picture: json[PICTURE],
      description: json[DESCRIPTION],
      city: json[CITY],
      price: json[PRICE],
      location: json[LOCATION],
      date: json[DATE],
      path: json[PATH],
      adminId: json[ADMINID],
      subAccountNumber: json[SUBACCOUNTNUMBER],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      ID: id,
      NAME: name,
      START_TIME: startTime,
      END_TIME: endTime,
      PICTURE: picture,
      DESCRIPTION: description,
      CITY: city,
      PRICE: price,
      LOCATION: location,
      DATE: date,
      ADMINID: adminId,
      PATH: path,
      SUBACCOUNTNUMBER: subAccountNumber,
    };
  }
}
