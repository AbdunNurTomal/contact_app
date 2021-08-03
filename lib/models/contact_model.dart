final String table_connect = "tbl_contact";
final String table_connect_col_id = "id";
final String table_connect_col_name = "name";
final String table_connect_col_phone = "phone";
final String table_connect_col_email = "email";
final String table_connect_col_address = "address";
final String table_connect_col_favorite = "favorite";

class Contact{
  int id;
  String name;
  String phone;
  String email;
  String address;
  bool favorite;

  Contact({
      this.id = -1,
      required this.name,
      required this.phone,
      required this.email,
      required this.address,
      this.favorite = false
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      table_connect_col_name: name,
      table_connect_col_phone: phone,
      table_connect_col_email: email,
      table_connect_col_address: address,
      table_connect_col_favorite: favorite ? 1 : 0,
    };
    if(id > 0){
      map[table_connect_col_id] = id;
    }
    return map;
  }

  factory Contact.fromMap(Map<String, dynamic> map) => Contact(
    id : map[table_connect_col_id],
    name : map[table_connect_col_name],
    phone : map[table_connect_col_phone],
    email : map[table_connect_col_email],
    address : map[table_connect_col_address],
    favorite : map[table_connect_col_favorite] == 0 ? false : true,
  );

  @override
  String toString() {
    return 'Contact{id: $id, name: $name, phone: $phone, email: $email, address: $address, favorite: $favorite}';
  }
}
