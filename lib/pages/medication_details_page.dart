import 'package:flutter/material.dart';
import 'package:flutter_gradient_colors/flutter_gradient_colors.dart';
import 'package:im_stepper/stepper.dart';
import 'package:smartwatch_application_sih/bmi_result_page.dart';
import 'package:smartwatch_application_sih/color_constants.dart';
import 'package:smartwatch_application_sih/data/medicine_data.dart';
import 'package:smartwatch_application_sih/data/medicines_obj.dart';
import 'package:smartwatch_application_sih/pages/mainpage.dart';
import 'package:smartwatch_application_sih/pages/medical_condition_page.dart';

import '../widgets/custom_button.dart';
import 'textstyles.dart';

class RecommendationDetailsPage extends StatefulWidget {
  const RecommendationDetailsPage({Key? key}) : super(key: key);

  @override
  State<RecommendationDetailsPage> createState() =>
      _RecommendationDetailsPageState();
}

class _RecommendationDetailsPageState extends State<RecommendationDetailsPage> {
  void openDialog(context) async{
    TextEditingController medicineName = TextEditingController();
    bool morning = false;
    bool afternoon = false;
    bool night = false;
    await showDialog(
        context: context,
        builder: (context) {
          return SingleChildScrollView(
            child: AlertDialog(
              title: const Text(
                'Medicine Details',
                style: const TextStyle(fontSize: 15),
              ),
              content: StatefulBuilder(
                  builder: (BuildContext context, StateSetter setState) {
                return SizedBox(
                  height: 300,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextField(
                        controller: medicineName,
                        autofocus: true,
                        decoration: const InputDecoration(
                            hintText: 'Medicine Name',
                            hintStyle: TextStyle(fontSize: 17)),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ChoiceChip(
                                  selectedColor: Colors.blue,
                                  avatar: const Icon(Icons.sunny_snowing),
                                  label: const Text('Morning'),
                                  selected: morning,
                                  onSelected: (value) {
                                    setState(() {
                                      morning = value;
                                    });
                                  }),
                              ChoiceChip(
                                  selectedColor: Colors.blue,
                                  avatar: const Icon(Icons.sunny),
                                  label: const Text('Afternoon'),
                                  selected: afternoon,
                                  onSelected: (value) {
                                    setState(() {
                                      afternoon = value;
                                    });
                                  }),
                            ],
                          ),
                          ChoiceChip(
                              selectedColor: Colors.blue,
                              avatar: const Icon(Icons.nights_stay_outlined),
                              label: const Text('Night'),
                              selected: night,
                              onSelected: (value) {
                                setState(() {
                                  night = value;
                                });
                              }),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              onPressed: () {
                                return Navigator.of(context).pop();
                              },
                              child: const Text('cancel')),
                          TextButton(
                              onPressed: () {
                                setState(() {
                                  allMedicines.add(Medicine(
                                      medicineName: medicineName.text,
                                      morning: morning,
                                      afternoon: afternoon,
                                      night: night));
                                });

                                return Navigator.of(context).pop();
                              },
                              child: const Text('confirm'))
                        ],
                      )
                    ],
                  ),
                );
              }),
            ),
          );
        });
  }

  bool inMedication = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    buildDataTable();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        theme: ThemeData(unselectedWidgetColor: Colors.grey),
        home: Scaffold(
            body: SafeArea(
                child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Text('Are you under regular medication ?',style: kHeaderStyle,textAlign: TextAlign.center,),
                    ),
                    Padding(
                     padding: EdgeInsets.all(8.0),
                     child: Text('Using this information, we can remind you to take medicines regularly',textAlign: TextAlign.center,style: kSubtitleStyle,),
                    ),
                    const Divider(),
                Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            child: RadioListTile(
                                title: const Text('Yes',
                                    style: TextStyle(
                                      color: Colors.black,
                                    )),
                                value: true,
                                groupValue: inMedication,
                                onChanged: (value) {
                                  setState(() {
                                    inMedication = true;
                                  });
                                }),
                          ),
                        ),
                        Expanded(
                          child: RadioListTile(
                              title: const Text('No',
                                  style: TextStyle(
                                    color: Colors.black,
                                  )),
                              value: false,
                              groupValue: inMedication,
                              onChanged: (value) {
                                setState(() {
                                  inMedication = false;
                                });
                              }),
                        )
                      ],
                    ),
                    !inMedication? Text(''): SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: buildDataTable()),
!inMedication? Text(''): Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(
                                child: InkWell(
                                  onTap: () => openDialog(context),
                                  child: Container(
                                    height: 30,
                                    width: 180,
                                    decoration: BoxDecoration(borderRadius:BorderRadius.circular(10),color: kprimaryGreenColor,),
                                    
                                    
                                      
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.add,color: kbuttonTextColor,),
                                          Text(' Add Medicine',
                                              style:kButtonStyle),
                                        ],
                                      )),
                                ),
                              ),
                            ),

                            const SizedBox(height:30),
                InkWell(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8,0, 8,10),
          child: Container(
              height: 60,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: kprimaryGreenColor , borderRadius: BorderRadius.circular(10)),
              child: Center(child: Text('NEXT',style: kButtonStyle))),
        ),
        onTap: () {
          // save_details();
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) {
                
            return MedicalConditionPage();
          }));
        })
                

              ],
            ),
          ),
        ))));
  }
}

class buildDataTable extends StatelessWidget {
  const buildDataTable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final columns = ['Medicine Name', 'Morning', 'Afternoon', 'Night'];
    return DataTable(columns: getColumns(columns), rows: getRows(allMedicines));
  }
}

List<DataRow> getRows(List<Medicine> allMedicines) =>
    allMedicines.map((Medicine medicine) {
      final cells = [
        medicine.medicineName,
        medicine.morning ? '✔' : '❌',
        medicine.afternoon ? '✔' : '❌',
        medicine.night ? '✔' : '❌',
      ];
      return DataRow(cells: getCells(cells));
    }).toList();

List<DataCell> getCells(List<dynamic> cells) {
  return cells.map((data) => DataCell(Text('$data'))).toList();
}

List<DataColumn> getColumns(List<String> columns) =>
    columns.map((String column) => DataColumn(label: Text(column))).toList();
