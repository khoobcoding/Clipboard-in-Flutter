import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ClipboardApp extends StatefulWidget {
  const ClipboardApp({super.key});

  @override
  State<ClipboardApp> createState() => _ClipboardAppState();
}

class _ClipboardAppState extends State<ClipboardApp> {
  final textcontroller1 = TextEditingController();
  final textcontroller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.indigo,
          title: const Text(
            'ClipBoard App',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.all(20),
                  child: SelectableText(
                    '''Flutter is an open-source UI software development kit created by Google. It is used to develop cross platform applications from a single codebase for any web browser,Fuchsia, Android, iOS, Linux, macOS, and Windows. First described in 2015, Flutter was released in May 2017.''',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 250,
                  child: TextFormField(
                    controller: textcontroller1,
                    minLines: null,
                    maxLines: null,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              textcontroller1.text.toString().isEmpty
                              ? ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('No Text Found'))
                              )
                              : Clipboard.setData(ClipboardData(text: textcontroller1.text)).then((value) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Copied'))
                              );
                              });
                            }, icon: const Icon(Icons.copy)),
                        hintText: 'Write something',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: 250,
                  child: TextFormField(
                    controller: textcontroller2,
                    minLines: null,
                    maxLines: null,
                    decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              Clipboard.getData(Clipboard.kTextPlain).then((value) {
                                textcontroller2.text=value!.text.toString();
                                // textcontroller2.text=textcontroller2.text+value!.text.toString();
                                 ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Pasted'))
                              );
                              });
                            }, icon: const Icon(Icons.paste)),
                        hintText: 'Write something',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5))),
                  ),
                ),
                const SizedBox(
                  height: 50,
                )
              ],
            ),
          ),
        ));
  }
}
