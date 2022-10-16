import "dart:math";

var random = Random();

var dos = [
  "Consume Carbohydrate foods such as wheat, rice, maize, jowar Green leafy vegetables ",
  "Use Vegetable oils to cook foods",
  "Having Fresh fruits can reduce cholestral",
  "Consumption of Low fat milk and fermented milk products such as buttermilk is advisable",
  "If possible consume some egg whites",
  "Undergo any type of physical exercises everyday",
  "Increase the use of vegetables and fruits",
  "Regular monitoring of glucose level is must",
  "Limit the use of potato",
  "Try to follow and regulary do yoga exercises"
];

var donts = [
  "Avoid taking Whole milk, butter and full-fat yogurt and cheese",
  "Avoid having meats of any kind",
  "Avoid having foods cooked in a deep fryer",
  "Avoid having Cookies, cakes and doughnuts",
  "Avoid having foods with artificial colors",
  "Never take sweets",
  "If possible skip dairy products",
  "Avoid alchohols in evry possible way",
  "Do'nt use tobaco",
  "The use of carbohydrated rich foods must be reduced"
];

dreturn_advice() {
  var advices = [];
  var choice = random.nextInt(9);
  for (int i = 0; i < 2; i++) {
    advices.add(dos[choice]);
    advices.add(donts[choice + 1]);
  }
  return advices;
}

void main() {
  print(dreturn_advice());
}
