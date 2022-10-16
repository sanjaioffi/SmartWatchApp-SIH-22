import "dart:math";

var random = Random();

var recommendations = [
  "Avoid using chemical products",
  "Avoid Hybrid fruits and vegetables",
  "Avoid Using Alchohol",
  "Avoid Smoking",
  "Goggle after taking  a meal",
  "Consume more Vegetables",
  "It is advised to use Neem stick",
  "Oil Massage in nasal cavity",
  "Do exercises regularly",
  "Consume fruits to improve your health",
  "Clean the eyes fequently",
  "Massage your head frequently",
  "Bath Twice a Day",
  "Maintain food diets properly",
  "Eat properly",
  "Have some Betel leaves after intake of food",
  "Do'nt skip breakfast"
];

General_recommendation() {
  var final_advices = [];
  // Yoga generation starts
  // Initalising the while loop to generate seven random yoga exercises
  while (final_advices.length != 5) {
    // The bool value is the representation of the existence of the element in the yoga exercise
    bool ispresent = false;
    // Yoga is the variable that holds the randomly picked yoga exercise
    var advice = recommendations[random.nextInt(17)];
    // Checking  whether the chosen yoga exercise is already in the function
    // Hence initialising a for loop to check the exercise
    for (int i = 0; i < final_advices.length; i++) {
      // Traversing through out the yoga list to check for the existing element
      if (advice == final_advices[i]) {
        // If the yoga is fountd to be present the bool val is changed to true
        ispresent = true;
        // Else nothing is changed
      }
    }
    // If the bool ispresent is false we add the exercise into the final exercise
    if (!ispresent) {
      // Add the exercise into the final exercise
      final_advices.add(advice);
    }
  }
  // Returning the yoga exercise
  return final_advices;
}

void main() {
  General_recommendation();
}



/*
Stop smoking.  
Choose good nutrition.  
High blood cholesterol.  
Lower high blood pressure. 
Be physically active every day. 
Aim for a healthy weight. 
Manage diabetes 
Reduce stress
*/