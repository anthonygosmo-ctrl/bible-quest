import 'package:flutter/material.dart';

void main() => runApp(const BibleQuestApp());

class BibleQuestApp extends StatelessWidget {
  const BibleQuestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bible Quest',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}

class Question {
  final String text;
  final List<String> options;
  final int correctIndex;

  Question({
    required this.text,
    required this.options,
    required this.correctIndex,
  });
}

final List<Question> questions = [
  Question(
    text:
        '1. But there went up a ____ from the earth, and watered the whole face of the ground.',
    options: ['water', 'mist', 'rain', 'moist'],
    correctIndex: 1,
  ),
  Question(
    text: '2. And Laban called it Jegar sahadutha: but Jacob called it ______.',
    options: ['Gilaed', 'Galaad', 'Galeed', 'Gilgal'],
    correctIndex: 2,
  ),
  Question(
    text: '3. Which son joseph received the greater blessing?',
    options: ['Benjamin', 'Ephraim', 'manasseh', 'Reuben'], //Genesis 48:19
    correctIndex: 1,
  ),
  Question(
    text: '4. How many years of famine did Joseph predict?',
    options: ['7.5 years', '8 years', '6 years', '7 years'], //Genesis 41:30
    correctIndex: 3,
  ),
  Question(
    text: '5. Who falsely accused Joseph and had him imprisoned?',
    options: [
      'Potiphar’s wife',
      'Putiphar’s wife',
      'Potephar’s wife',
      'Potiphor’s wife',
    ], //Genesis 39:17–20
    correctIndex: 0,
  ),
  Question(
    text: '6. What was the name of Abram’s first son?',
    options: ['Issac', 'Ishmael', 'Jacob', 'Esau'], //Genesis 16:15
    correctIndex: 1,
  ),
  Question(
    text: '7. Who was the mother of Isaac?',
    options: ['Rachel', 'Rebecca', 'Sarah', 'Elizabet'], //Genesis 21:3
    correctIndex: 2,
  ),
  Question(
    text: '8. Who turned into a pillar of salt?',
    options: [
      'Lot’s wife',
      'Lote',
      'Lot',
      'Lote’s wife', //Genesis 19:26
    ],
    correctIndex: 0,
  ),
  Question(
    text: '9. What sign did God give as a covenant after the flood?',
    options: ['Moist', 'Rain', 'Cloud', 'Rainbow'], //Genesis 9:13
    correctIndex: 3,
  ),
  Question(
    text: '10. Name of Noah’s three sons?',
    options: [
      'Shem,Ham, and Japheth',
      'Sham,Hem, and Japheth',
      'Shemis,Ham, and Japhe',
      'Sheimm,Hamme, and Japhith',
    ], //Genesis 9:18
    correctIndex: 0,
  ),
  Question(
    text: '11. Who built the ark?',
    options: ['Jacob', 'Issac', 'Joseph', 'Noah'], //Genesis 6:13–14
    correctIndex: 3,
  ),
  Question(
    text: '12. What tower did people build to reach heaven? ',
    options: [
      'Tower of Kael',
      'Tower of Babel',
      'Tower of Sinai',
      'Tower of Baal',
    ], //Genesis 11:1-9
    correctIndex: 1,
  ),
  Question(
    text: '13. Who created the heavens and the earth? ',
    options: ['Jesus', 'Angels', 'God', 'Goddess'], //Genesis 1:1
    correctIndex: 2,
  ),
  Question(
    text: '14. From what was Eve created?  ',
    options: [
      'Adam’s limbs',
      'Adam’s hips',
      'Adam’s rib',
      'Adam’s Back',
    ], //Genesis 2:22
    correctIndex: 2,
  ),
  Question(
    text: '15. Who was Jacob’s uncle?',
    options: ['Laban', 'Bethuel', 'Ruben', 'Judah'], //Genesis 29:10
    correctIndex: 0,
  ),
  Question(
    text: '16. Name of Jacob’s two wives? ',
    options: [
      'Leah and Sarah',
      'Rebecca and Rachel',
      'Leah and Rebecca',
      'Leah and Rachel',
    ], // Genesis 29:28
    correctIndex: 3,
  ),
  Question(
    text:
        '17. Jacob see a ladder reaching to heaven And he called the name of that place _____?',
    options: ['Bethel', 'Luz', 'Haran', 'Sinai'], //Genesis 28:12
    correctIndex: 0,
  ),
  Question(
    text: '18. Who was Jacob’s favorite son?',
    options: ['Benjamin', 'Joseph', 'Judah', 'Levi'], //Genesis 37:3
    correctIndex: 1,
  ),
  Question(
    text: '19. Who blessed Joseph’s sons, Ephraim and Manasseh?',
    options: ['Ishmael', 'Abraham', 'Isaac', 'Jacob'], //Genesis 48:20
    correctIndex: 3,
  ),
  Question(
    text: '20. Who was the youngest son of Jacob?',
    options: ['Simeon', 'Benjamin', 'Joseph', 'Issachar'], //Genesis 35:18
    correctIndex: 1,
  ),
  Question(
    text: '21. Where was Joseph buried?',
    options: [
      'His bones were later carried to Shechem',
      'His bones were later carried to Haran',
      'His bones were later carried to Egypt',
      'His bones were later carried to Ephraim',
    ], //Genesis 50:25; Joshua 24:32
    correctIndex: 0,
  ),
  Question(
    text: '22. On which day did God create man?',
    options: ['4th day', '5th day', '7th day', '6th day'], //Genesis 1:26–31
    correctIndex: 3,
  ),
  Question(
    text: '23. What was the name of the garden where Adam and Eve lived',
    options: ['Eve', 'Truth', 'Eden', 'Idin'], //Genesis 2:8
    correctIndex: 2,
  ),
  Question(
    text: '24. Who walked with God and was taken without dying?',
    options: ['Enos', 'Enoch', 'Methuselah', 'Lamech'], //Genesis 5:24
    correctIndex: 1,
  ),
  Question(
    text: '25. Who tempted Eve to eat the forbidden fruit?',
    options: ['serpent', 'Adan', 'fruit', 'good and evil'], //Genesis 3:1–6
    correctIndex: 0,
  ),
  Question(
    text: '26.How many people were saved in the noahs ark?',
    options: ['6', '9', '7', '8'], //Genesis 7:13
    correctIndex: 3,
  ),
  Question(
    text:
        '27. God placed at the east of the garden of Eden Cherubims, and a ____ which turned every way, to keep the way of the tree of life.',
    options: [
      'flaming axe',
      'Fire',
      'flaming sword',
      'Tornado',
    ], //Genesis 3:23–24
    correctIndex: 2,
  ),
  Question(
    text: '28. What did God do to stop the building of Babel? ',
    options: [
      'Confused their brothers',
      'Confused their feelings',
      'Confused their thoughts',
      'Confused their language',
    ], //Genesis 11:7
    correctIndex: 3,
  ),
  Question(
    text: '29. Who was called out of Ur to go to a land God would show him?',
    options: ['Abraham', 'Jacob', 'Isaac', 'Joseph'], //Genesis 12:1
    correctIndex: 0,
  ),
  Question(
    text: '30. What was the name of Abram’s wife?',
    options: ['milcah', 'rachel', 'Sarah', 'Rebecca'], //Genesis 11:29
    correctIndex: 2,
  ),
  Question(
    text: '31. Who were Adam and Eve’s first two sons?',
    options: [
      'shem and ham',
      'abel and seth',
      'Cain and Abel',
      'cain and seth',
    ], //Genesis 4:1–2
    correctIndex: 2,
  ),
  Question(
    text: '32. What did God ask Abraham to sacrifice?',
    options: [
      'His son',
      'His dauther',
      'His wife',
      'His sevant',
    ], //Genesis 22:2
    correctIndex: 0,
  ),
  Question(
    text: '33. Who was Isaac’s wife?',
    options: ['Sarah', 'Rebekah', 'Lea', 'Rachel'], //Genesis 24:67
    correctIndex: 1,
  ),
  Question(
    text:
        '34. And Joseph said unto his ______, I die: and God will surely visit you, and bring you out of this land unto the land which he sware to Abraham, to Isaac, and to Jacob. ',
    options: ['Children', 'People', 'Brother', 'brethren'], //Genesis 50:24
    correctIndex: 3,
  ),
  Question(
    text: '35. Who killed his brother out of jealousy?',
    options: ['Seth', 'Enoch', 'Cain', 'Abel'], //Genesis 4:8
    correctIndex: 2,
  ),
  Question(
    text: '36. Who was Abram’s nephew?',
    options: ['Lot', 'Terah', 'Nahor', 'Ketorah'], //
    correctIndex: 0,
  ),
  Question(
    text: '37. What cities did God destroy for their wickedness?',
    options: [
      'Sadom and Gamura',
      'Sodom and Gomorrah',
      'Sodam and Gomarrah',
    ], //Genesis 19:24
    correctIndex: 1,
  ),
  Question(
    text: '38. how many sons of isaac?',
    options: ['4', '6', '3', '2'], //Genesis 25:25–26
    correctIndex: 3,
  ),
  Question(
    text: '39. Who sold his birthright for a meal?',
    options: ['Esau', 'Jacob', 'Isaac', 'Abraham'], //Genesis 25:33
    correctIndex: 0,
  ),
  Question(
    text: '40. Who tricked Isaac to receive the blessing?',
    options: ['Judah', 'Levi', 'Jacob', 'Esau'], //Genesis 27:19
    correctIndex: 2,
  ),
  Question(
    text: '41. What did Joseph’s brothers do to him?',
    options: [
      'Sold him to Ishmeelites',
      'Sold him to Midianites',
      'Sold him to Egypt',
      'Sold him to Jebosioh',
    ], //Genesis 37:28
    correctIndex: 0,
  ),
  Question(
    text: '42. how much joseph sold to merchantmen?',
    options: [
      '30 pieces of silver',
      '40 pieces of silver',
      '60 pieces of silver',
      '20 pieces of silver',
    ], //Genesis 37:28
    correctIndex: 3,
  ),
  Question(
    text: '43. Where was Jacob buried?',
    options: [
      'Cave of Haran',
      'Cave of Machpelah',
      'Cave of Epron',
      'Cave of Mamre',
    ], //Genesis 50:13
    correctIndex: 1,
  ),
  Question(
    text: '44. Who was the father of Abram’s wife Sarai?',
    options: ['Nahor', 'Haran', 'Terah', 'Lot'], //Genesis 11:29
    correctIndex: 2,
  ),
  Question(
    text: '45. Who was the king that Abraham rescued Lot from?',
    options: ['Chedorlaomer', 'Amraphel', 'Arioch', 'Tidal'], //Genesis 1:15
    correctIndex: 0,
  ),
  Question(
    text: '46. Who was the priest of Salem that blessed Abram?',
    options: ['Aaron', 'Eli', 'Ahimelech', 'Melchizedek'], //Genesis 14:18-19
    correctIndex: 3,
  ),
  Question(
    text: '47. Who was Hagar, the mother of Ishmael?',
    options: [
      'Sarah’s Egyptian handmaid',
      'Rebekah’s Egyptian handmaid',
      'Lea’s Egyptian handmaid',
      'Rachel’s Egyptian handmaid',
    ], //Genesis 16:1
    correctIndex: 0,
  ),
  Question(
    text:
        '48. Who was the king that took Sarah but was warned by God in a dream?',
    options: ['Amraphel', 'Abimelech', 'Arioch', 'Chedorlaomer'], //Genesis 20:3
    correctIndex: 1,
  ),
  Question(
    text: '49. Who was the daughter of Jacob and Leah?',
    options: ['Adah', 'Zillah', 'Naamah', 'Dinah'], //Genesis 34:1
    correctIndex: 3,
  ),
  Question(
    text: '50. Who was the cupbearer that forgot Joseph in prison?',
    options: [
      'Pharaoh’s servant',
      'Pharaoh’s chief butler',
      'Pharaoh’s cup bearer',
      'Pharaoh’s chief Army',
    ], //Genesis 40:23
    correctIndex: 1,
  ),
  // Add more questions here...
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade100,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Welcome to Bible Quest!',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const QuizScreen()),
                );
              },
              child: const Text('Start Quest'),
            ),
            const SizedBox(height: 40),
            const Text('Created By: GOSMO LTD PH'),
          ],
        ),
      ),
    );
  }
}

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int current = 0;
  int score = 0;
  List<int?> answers = [];

  void next(int selected) {
    answers.add(selected);
    if (selected == questions[current].correctIndex) score++;
    if (current + 1 < questions.length) {
      setState(() => current++);
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => ResultScreen(score: score, total: questions.length),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final q = questions[current];
    return Scaffold(
      appBar: AppBar(
        title: Text('Question ${current + 1} of ${questions.length}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(q.text, style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            ...List.generate(q.options.length, (i) {
              return ElevatedButton(
                onPressed: () => next(i),
                child: Text(q.options[i]),
              );
            }),
          ],
        ),
      ),
    );
  }
}

class ResultScreen extends StatelessWidget {
  final int score;
  final int total;

  const ResultScreen({super.key, required this.score, required this.total});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade100,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Score: $score / $total',
              style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Text(
              'Thank you for participating!',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () => Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const HomeScreen()),
              ),
              child: const Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
