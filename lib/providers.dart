import 'package:firebase_ai/firebase_ai.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

final responseProvider = FutureProvider.autoDispose.family((ref, String prompt) async {
  final model = FirebaseAI.googleAI().generativeModel(model: 'gemini-2.5-flash');
  final prompt = [Content.text(ref.read(promptProvider))];
  final response = await model.generateContent(prompt);
  return response.text;
});

final promptProvider = StateProvider<String>((ref){return '';});