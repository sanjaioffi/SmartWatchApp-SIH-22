import "dart:math";

var random = Random();

var dos = [
  "Did you know that Eggs reduce cholestral",
  "Did you know that Garlic reduce cholestral",
  "Try to consume lean meat which reduces cholestral",
  "Having Fresh fruits can reduce cholestral",
  "Consumtion of Gugul can reduce cholestral",
  "Consuming Shell fish reduces cholestral"
];

var donts = [
  "Avoid taking Carrots, Beetroots, Apples",
  "Avoid having foods with high carbohydrate ",
  "Avoid having bevarges like Tea, coffee, colas ",
  "Avoid having foods with added sugar",
  "Avoid having packed foods",
  "Avoid having foods with artificial colors"
];

creturn_advice() {
  var advices = [];
  var choice = random.nextInt(5);
  for (int i = 0; i < 2; i++) {
    advices.add(dos[choice]);
    advices.add(donts[choice + 1]);
  }
  return advices;
}

void main() {
  print(creturn_advice());
}
