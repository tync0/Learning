import 'package:auto_route/auto_route.dart';
import 'package:education/utils/constanst.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class VocabularyScreen extends StatelessWidget {
  final List<Map<String, String>> vocabularyList = [
    {
      'word': 'Hello',
      'translation': 'Merhaba',
      'description': 'Karşılama veya selamlama ifadesi.'
    },
    {
      'word': 'Goodbye',
      'translation': 'Hoşça kal',
      'description': 'Ayrılma veya veda ifadesi.'
    },
    {
      'word': 'Thank you',
      'translation': 'Teşekkür ederim',
      'description': 'Minnettarlık veya takdir ifadesi.'
    },
    {
      'word': 'Please',
      'translation': 'Lütfen',
      'description': 'Kibar bir rica veya davet ifadesi.'
    },
    {
      'word': 'Yes',
      'translation': 'Evet',
      'description': 'Olumlu bir yanıt veya onay ifadesi.'
    },
    {
      'word': 'No',
      'translation': 'Hayır',
      'description': 'Olumsuz bir yanıt veya anlaşmama ifadesi.'
    },
    {
      'word': 'Sorry',
      'translation': 'Üzgünüm',
      'description': 'Pişmanlık veya özür ifadesi.'
    },
    {
      'word': 'Excuse me',
      'translation': 'Affedersiniz',
      'description': 'Dikkat veya bağışlama isteği ifadesi.'
    },
    {
      'word': 'I love you',
      'translation': 'Seni seviyorum',
      'description': 'Derin bir sevgi veya romantik his ifadesi.'
    },
    {
      'word': 'How are you?',
      'translation': 'Nasılsınız?',
      'description': 'Birinin sağlık durumu hakkında soru sorma ifadesi.'
    },
    // Add more vocabulary words as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vocabulary'),
      ),
      body: ListView.builder(
        itemCount: vocabularyList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              vocabularyList[index]['word'].toString(),
              style: Utils.titleTextStyle.copyWith(fontSize: 18.sp),
            ),
            subtitle: Text(
              vocabularyList[index]['translation'].toString(),
              style: Utils.subtitleTextStyle.copyWith(fontSize: 16.sp),
            ),
            onTap: () {
              _showDescriptionDialog(context, vocabularyList[index]);
            },
          );
        },
      ),
    );
  }

  void _showDescriptionDialog(
      BuildContext context, Map<String, String> wordData) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(wordData['word'].toString()),
          content: Text(wordData['description'].toString()),
          actions: [
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
