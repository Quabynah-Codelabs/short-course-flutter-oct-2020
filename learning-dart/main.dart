void main() {
  print("Learning classes");

  // Created Chris using default constructor
  var chris = Customer();

  // setter
  chris.name = "Chris";
  chris.phone = 0546578931;

  // reinette
  final reinette = Customer(id: 2, firstName: "Reinette", phone: 5468789231);

  // baba
  Customer baba = Customer.named(phone: 87879878778);
  print("Baba's name is ${baba.name}");

  print("Second customer is called ${reinette.name}");

  print("This customer's phone number is ${chris.phone}"); // getter
}

// This is a Customer class
class Customer {
  // fields
  int id;
  String name;
  int phone;

  // methods
  bool canBuy() {
    return true;
  }

  // constructors
  // 1. Non -parameterized
  // Customer();

  // 2. Parameterized
  Customer({String firstName, int phone, int id}) {
    this.name = firstName;
    this.id = id;
    this.phone = phone;
  }

  // 3. Named constructor
  Customer.named({String name, var phone}) {
    this.id = 1;
    this.name = name;
    this.phone = phone;
  }
}
