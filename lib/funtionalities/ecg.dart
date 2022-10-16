// Importing global variables
import 'globals.dart' as globals;

var list = [];
// Afib
return_afib(var data) {
  // Code goes here
  var parameter = 0;
  if (globals.isdiabetic) {
    parameter++;
  } else if (globals.age > 49) {
    parameter++;
  } else if (globals.health_data[3] < 60 || globals.health_data[3] > 100) {
    // Health data;
    return;
  }
  var stableness = 0;
  var issue = data.length / 3;
  for (int i = 0; i < data.length - 2; i++) {
    // First Loop
    for (int j = i + 1; j < data.length - 1; i++) {
      // Second loop
      for (int z = j + 1; j < data.length; j++) {
        // Third Loop
        if (data[i] == data[j] && data[j] == data[z] && data[z] == data[j]) {
          // condiditons
          stableness += 1;
        }
      }
    }
  }

  var abnormal_rythm = 0;

  if (globals.age > 51) {
    abnormal_rythm += 1;
  }

  if (globals.isHeartPatient) {
    abnormal_rythm += 1;
  }

  if (globals.hasBP) {
    abnormal_rythm += 1;
  }

  var counter = 0;

  for (int i = 0; i < data.length - 1; i++) {
    // First Loop
    {
      // Iterating the first loop
      for (int j = i + 1; j < data.length; j++) {
        //Second Loop
        if (data[i] == data[j]) {
          // Conditions
          counter += 1;
        }
      }
    }
  }
  if (abnormal_rythm == 3) {
    list.add(
        "Healher has detected some issues in the heart rate conditions. It is recommended to consult a regular physician");
  }

  if (stableness == issue) {
    list.add(
        "Healer could'nt detect the ppg data properly. The ppg datas are fluctuated. It is recommended to saty idle in a stable position");
  } else{
  list.add("Healher could'nt find any heart abnormility");
  }
}

// Return the largest
return_largest(var data) {
  // Code
  var largest = data[0];
  for (int i = 0; i < data.length; i++) {
    // Code goes here
    if (data[i] > largest) {
      largest = data[i];
    }
  }
  return largest;
}

// Return the smallest
return_smallest(var data) {
  // Code
  var smallest = data[0];
  for (int i = 0; i < data.length; i++) {
    if (smallest > data[i]) {
      smallest = data[i];
    }
  }
  return smallest;
}

return_average(var data) {
  // code here
  var sum = 0;
  for (int i = 0; i < data.length; i++) {
    // code
    sum = data[i] + sum;
  }
  var average = sum ~/ data.length;
  return average;
}

// Generate ecg val
generate_ecg(var ppg_data) {
  // code goes here
  return_afib(ppg_data);
  var min_val, max_val, average_val;
  var max_seed, min_seed, average_seed;
  var min_ad, avg_add, max_ad;
  average_seed = 64172;
  min_seed = 63853;
  max_seed = 64456;
  min_val = return_smallest(ppg_data);
  max_val = return_largest(ppg_data);
  average_val = average_seed - return_average(ppg_data);
  min_val = min_seed - min_val;
  max_val = max_seed - max_val;
  var final_stream = [];
  min_ad = 5;
  avg_add = 12;
  average_seed = 64172;
  min_seed = 63853;
  max_seed = 64456;
  for (int i = 0; i < 3; i++) {
    //Code
    final_stream.add(average_val);
  }
  final_stream.add(average_val + 35);
  final_stream.add(average_val + 12);
  for (int i = 0; i < 1; i++) {
    //Code
    final_stream.add(average_val);
  }
  final_stream.add(average_val -70);
  final_stream.add(max_val+50);
  final_stream.add(average_val-120);
  print(max_val);
  print(min_val - 500);
  final_stream.add(average_val + 5);

  final_stream.add(average_val + 15);
  final_stream.add(average_val);
  for (int i=0;i<2;i++){
    final_stream+=final_stream;
  }
  list.add(final_stream);
  return list;
}

void main() {
  // Calling the function
  print(generate_ecg([1, 2, 3, 4, 5, 6]));
}
