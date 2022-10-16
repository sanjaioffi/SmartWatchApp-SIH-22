// Importing dart math file
import 'dart:math';

/*
According to Ayurveda there are some rules for the healthy practices of sex
7. ..
8. 
9. According to Ayurveda, your sex life is governed by the four seasons during which your body strength changes.
	1. 
	2.
	3. 

*/

// Random functions
var random = Random();

// Safe Sex recommendations goes here
safe_sex() {
  var advices = [];
  // Safe sex recommendations
  var sex_recommendations = [
    "Couple should not have sex during the female partner periods",
    "Clean the private parts before having sex",
    "Avoid sex during pregnancy time or immediate after delivery of the Foetus.",
    "No violence during sex rather that make love during sex",
    "Sex on empty stomach or after a heavy meal can cause Vata and Pitta imbalance",
    "Have sex when you are physically and mentally fit for it",
    "Body Strength is lower in Monsoon and Summer, hence have less sex duing this time",
    "Body Strength is moderate in Spring, hence 3 days is advisable for having sex",
    "Body Strength is high in winter, hence one can have sex daily.",
    "It is essential to clean your private parts after sexual intercourse",
    "Proper"
  ];
  while (advices.length != 7) {
    // Initialisng commands
    var choice = sex_recommendations[random.nextInt(9)];
    bool ispresent = false;
    for (int i = 0; i < advices.length; i++) {
      if (sex_recommendations[i] == choice) {
        // Ifpresent
        ispresent = true;
      }

    }
          if (!ispresent) {
        advices.add(choice);
      }
  }
  return advices;
}

void main() {
  // Calling the function
}
