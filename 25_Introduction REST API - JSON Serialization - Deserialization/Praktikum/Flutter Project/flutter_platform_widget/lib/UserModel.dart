class UserModel {
  final String name;
  final String phoneNumber;

  UserModel(
      {required this.name,
      required this.phoneNumber,
      });
}

final List<UserModel> userList = [
  UserModel(
      name: "Leanne Graham",
      phoneNumber: "1-770-736-8031 x56442",
      ),
  UserModel(
      name: "Ervin Howell",
      phoneNumber: "010-692-6593 x09125",
      ),
  UserModel(
      name: "Clementine Bauch",
      phoneNumber: "1-463-123-4447",
      ),
  UserModel(
      name: "Patricia Lebsack",
      phoneNumber: "493-170-9623 x156",
      ),
  UserModel(
      name: "Chelsey Dietrich",
      phoneNumber: "(254)954-1289",
      ),
  UserModel(
      name: "Mrs. Dennis Schulist",
      phoneNumber: "010-692-6593 x09125",
      ),
  UserModel(
      name: "Kurtis Weissnat",
      phoneNumber: "210.067.6132",
      )
];
