import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:medgenie/providers.dart';

class ReportPage extends ConsumerWidget {
  const ReportPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final prompt = ref.watch(promptProvider);
    final response = ref.watch(responseProvider(prompt));
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(15,50,20,60),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.cyan, width: 1.5),
            borderRadius: BorderRadius.circular(10)
          ),
          child: SingleChildScrollView(
            child: response.when(
              data: (data) {
                return Text(
                          data ?? '',
                          style: TextStyle(
                            fontSize: 15,
                            letterSpacing: 1.25
                          ),
                );
              },
              loading: () {
                return Center(child: CircularProgressIndicator());
              },
              error: (error, stackTrace) {
                return Text(
                  error.toString(),
                  style: TextStyle(
                    fontSize: 15,
                    letterSpacing: 1.25
                  ),
                );
              },
            )
          ),
        ),
      ),
    );
  }
}