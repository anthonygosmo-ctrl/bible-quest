

import 'package:flutter/material.dart';

void main() =>runApp(const BibleQuestApp());

/// Root app
class BibleQuestApp extends StatelessWidget {
  const BibleQuestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bible Quest',
debugShowCheckedModeBanner: false,
      theme: ThemeData(
colorSchemeSeed: Colors.deepPurple,
        useMaterial3: true,
        brightness: Brightness.light,
      ),
darkTheme: ThemeData(
colorSchemeSeed: Colors.deepPurple,
        useMaterial3: true,
        brightness: Brightness.light,
      ),
themeMode: ThemeMode.system,
      home: const HomeScreen(),
    );
  }
}

/// =======================
/// Models
/// =======================

class Question {
  final String text;
  final List<String>options;
  final int correctIndex;

  const Question({
    required this.text,
    required this.options,
    required this.correctIndex,
  });
}

class WrongAnswer {
  final Question question;
  final int? yourIndex;

WrongAnswer({required this.question, required this.yourIndex});
}

/// =======================
/// Sample Questions (edit/add as you wish)
/// ======================= answer 0,1,2,3 or a. b. c. d

final List<Question>kQuestions = [
Question(
    text: '1. But there went up a ____ from the earth, and watered the whole face of the ground.',
    options: ['water', 'mist', 'rain', 'moist'],
correctIndex: 1,
  ),
Question(
    text: '2. And Laban called it Jegar sahadutha: but Jacob called it ______.',
    options: ['Gilaed', 'Galaad', 'Galeed', 'Gilgal'],
correctIndex: 2,
  ),
Question(
    text: 'Where was Jesus born?',
    options: ['Nazareth', 'Jerusalem', 'Bethlehem', 'Galilee'],
correctIndex: 2,
  ),
Question(
    text: 'First book of the Bible?',
    options: ['Exodus', 'Genesis', 'Leviticus', 'Numbers'],
correctIndex: 1,
  ),
Question(
    text: 'Who was swallowed by a great fish?',
    options: ['Jonah', 'Moses', 'Elijah', 'Peter'],
correctIndex: 0,
  ),
Question(
    text: 'Mountain where Moses received the Ten Commandments?',
    options: ['Ararat', 'Sinai', 'Zion', 'Carmel'],
correctIndex: 1,
  ),
Question(
    text: 'Who betrayed Jesus?',
    options: ['Peter', 'John', 'Judas Iscariot', 'Thomas'],
correctIndex: 2,
  ),
Question(
    text: 'Shortest verse (KJV/most traditions)?',
    options: ['“Jesus wept.”', '“God is love.”', '“Rejoice always.”', '“Pray continually.”'],
correctIndex: 0,
  ),
Question(
    text: 'What did God create on the first day?',
    options: ['Land', 'Animals', 'Light', 'Plants'],
correctIndex: 2,
  ),
Question(
    text: 'Which apostle doubted until seeing Jesus’ wounds?',
    options: ['Peter', 'Paul', 'James', 'Thomas'],
correctIndex: 3,
  ),
  // ➕ Add more here up to 20 or more…
];

/// =======================
/// Screens
/// =======================

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
appBar: AppBar(title: const Text('FBC Quest Home')),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: width < 480 ? width * 0.9 : 480),
          child: Column(
mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Welcome to Bible Quest!',
style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                ),
onPressed: () {
Navigator.push(
                    context,
MaterialPageRoute(
                      builder: (_) =>QuizScreen(questions: kQuestions),
                    ),
                  );
                },
                child: const Text('Start Quest'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class QuizScreen extends StatefulWidget {
  final List<Question>questions;
  const QuizScreen({super.key, required this.questions});

  @override
  State<QuizScreen>createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late final List<int?>selections;
  int index = 0;

  @override
  void initState() {
super.initState();
    selections = List<int?>.filled(widget.questions.length, null);
  }

  void _next() {
    final isLast = index == widget.questions.length - 1;

    if (selections[index] == null) {
ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select an answer before continuing.')),
      );
return;
    }

    if (!isLast) {
setState(() => index++);
    } else {
      // compute score + wrong answers
      int score = 0;
      final wrongs = <WrongAnswer>[];
      for (int i = 0; i<widget.questions.length; i++) {
        final q = widget.questions[i];
        final sel = selections[i];
        if (sel == q.correctIndex) {
          score++;
        } else {
wrongs.add(WrongAnswer(question: q, yourIndex: sel));
        }
      }
Navigator.pushReplacement(
        context,
MaterialPageRoute(
          builder: (_) =>ResultScreen(
            score: score,
            total: widget.questions.length,
            wrongs: wrongs,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final q = widget.questions[index];
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
appBar: AppBar(
        title: Text('Question ${index + 1} of ${widget.questions.length}'),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: width < 560 ? width * 0.95 : 560),
          child: Column(
crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 16),
LinearProgressIndicator(
                value: (index + 1) / widget.questions.length,
              ),
              const SizedBox(height: 24),
Text(
q.text,
                style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 16),
              ...List.generate(q.options.length, (i) {
                return Card(
                  child: RadioListTile<int>(
                    title: Text(q.options[i]),
                    value: i,
groupValue: selections[index],
onChanged: (val) =>setState(() => selections[index] = val),
                  ),
                );
              }),
              const Spacer(),
Row(
                children: [
                  if (index > 0)
OutlinedButton(
onPressed: () =>setState(() => index--),
                      child: const Text('Back'),
                    ),
                  const Spacer(),
ElevatedButton(
onPressed: _next,
                    child: Text(index == widget.questions.length - 1 ? 'Finish' : 'Next'),
                  ),
                ],
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class ResultScreen extends StatelessWidget {
  final int score;
  final int total;
  final List<WrongAnswer>wrongs;

  const ResultScreen({
super.key,
    required this.score,
    required this.total,
    required this.wrongs,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
appBar: AppBar(title: const Text('Results')),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: width < 560 ? width * 0.95 : 560),
          child: Column(
crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24),
Text(
                'Your Score: $score / $total',
                style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
Text(
                'Correct: $score • Wrong: ${total - score}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 24),
              if (wrongs.isEmpty)
                const Expanded(
                  child: Center(
                    child: Text('Perfect! Congratualation🎉🎉🎉'),
                  ),
                )
              else
Expanded(
                  child: ListView.separated(
itemCount: wrongs.length,
separatorBuilder: (_, __) => const SizedBox(height: 8),
itemBuilder: (context, i) {
                      final w = wrongs[i];
                      final your = w.yourIndex == null
                          ? '(no answer)'
                          : w.question.options[w.yourIndex!];
                      final correct = w.question.options[w.question.correctIndex];

                      return ListTile(
tileColor: Theme.of(context).colorScheme.surfaceContainer,
                        title: Text(w.question.text),
                        subtitle: Column(
crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
Text('Your answer: $your',
                                style: TextStyle(color: Theme.of(context).colorScheme.error)),
Text('Correct answer: $correct',
                                style: TextStyle(color: Theme.of(context).colorScheme.primary)),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              const SizedBox(height: 16),
Row(
                children: [
OutlinedButton(
onPressed: () =>Navigator.pushAndRemoveUntil(
                      context,
MaterialPageRoute(builder: (_) => const HomeScreen()),
                      (route) => false,
                    ),
                    child: const Text('Back to Home'),
                  ),
                  ],
            ),
          ],
        ),
      ),
        ),
    );
  }
}
