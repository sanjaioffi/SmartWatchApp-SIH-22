import "dart:math";

var random = Random();

var recommendations = [
  "Stop smoking",
  "Choose good nutrition",
  "Aim for a healthy weight",
  "Manage diabetes",
  "Try to consult a doctor for every now and then",
  "Be physically active every day",
  "If possible go for a walk or  ajob daily",
  "Yoga, pranayam, meditation are must",
  "Try not to get temper",
  "Try to wake up eraly and go for a walk in the early morning",
  "Try to avoid excessive sleeping",
  "Never try to Stop urination",
  "Don't feel anxiety",
  "Do'nt take regular fast foods"
];

heart_recommendations() {
  var final_advices = [];
  // Yoga generation starts
  // Initalising the while loop to generate seven random yoga exercises
  while (final_advices.length != 5) {
    // The bool value is the representation of the existence of the element in the yoga exercise
    bool ispresent = false;
    // Yoga is the variable that holds the randomly picked yoga exercise
    var advice = recommendations[random.nextInt(13)];
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
  print(heart_recommendations());
}



/*
Stop smoking.  
 Lower high blood pressure. 
*/