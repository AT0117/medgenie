import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medgenie/providers.dart';
import 'package:medgenie/report.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {

    TextEditingController symptomsController = TextEditingController();
    TextEditingController detailsController = TextEditingController();
    TextEditingController conditionController = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20, 60, 20, 20),
          child: Center(
            child: Column(
              children: [
                Text(
                  'MEDGENIE',
                  style: TextStyle(color: Colors.cyan, letterSpacing: 3, fontSize: 30),
                ),
                SizedBox(height: 120),
                TextField(
                  controller: symptomsController,
                  cursorColor: Colors.cyan,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Colors.cyan, width: 1.5)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Colors.cyan, width: 1.5)
                    ),
                    hintText: 'Enter Symptoms'
                  ),
                ),
                SizedBox(height: 30),
                TextField(
                  controller: detailsController,
                  cursorColor: Colors.cyan,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Colors.cyan, width: 1.5)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Colors.cyan, width: 1.5)
                    ),
                    hintText: 'Physical stats (age, height, weight)'
                  ),
                ),
                SizedBox(height: 30),
                TextField(
                  controller: conditionController,
                  cursorColor: Colors.cyan,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Colors.cyan, width: 1.5)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(color: Colors.cyan, width: 1.5)
                    ),
                    hintText: 'Any existing conditions?'
                  ),
                ),
                SizedBox(height: 75),
                ElevatedButton(
                  onPressed: () {
                    if(symptomsController.text.isEmpty || detailsController.text.isEmpty || conditionController.text.isEmpty){
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                          content: Text('Please fill all the fields. Type None in case'),
                          duration: Duration(seconds: 2),
                        ),
                      );
                    }
                    else{
                      ref.read(promptProvider.notifier).state = '''
                        Patient has symptoms \n ${symptomsController.text}
                        Patients physical stats(age, height, weight) \n ${detailsController.text}
                        Patients existing conditions \n ${conditionController.text}
                        Give a concise remedy divided into 3 parts -
                        1) Remedies
                        2) Dietary changes
                        3) Lifestyle changes
                        Note - Dont put ** over text in an attempt to make it bold.
                        Just straightforward text
                      ''';
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const ReportPage()),);
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.cyan),
                    foregroundColor: WidgetStatePropertyAll(Colors.white)
                  ),
                  child: Text('Generate Report'),
                )
              ],
            ),
          ),
        ),
      )
    );
  }
}