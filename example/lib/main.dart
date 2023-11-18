import 'package:advanced_text/advanced_text.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AdvancedText Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const AdvancedTextExample(),
    );
  }
}

class AdvancedTextExample extends StatelessWidget {
  const AdvancedTextExample({super.key});

  final String text =
      "At parthdarji.com, we curate a collection of impactful applications that transcend both Android and iOS platforms. Our mission is to redefine digital experiences through innovative contributions and cutting-edge solutions. Join us in exploring the forefront of technology and shaping the future of mobile applications.";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("AdvancedText Demo"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            AdvancedText(
              "www.parthdarji.com\n$text",
              textCustomization: const TextCustomization(
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
              features: const AdvancedTextFeatures(
                hyperlink: Hyperlink(
                  enable: true,
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold,
                    decorationColor: Colors.blue,
                  ),
                ),
                readMore: ReadMore(
                  enable: true,
                  expandedText: "...Collapse",
                  collapsedText: "...Expand",
                  trim: AdvancedTrimmer(
                    length: 300,
                    mode: TrimMode.length,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            AdvancedText(
              "www.parthdarji.com\n$text",
              features: const AdvancedTextFeatures(
                hyperlink: Hyperlink(
                  enable: true,
                  style: TextStyle(
                    color: Colors.green,
                    decoration: TextDecoration.underline,
                    fontWeight: FontWeight.bold,
                    decorationColor: Colors.blue,
                  ),
                ),
                readMore: ReadMore(
                  enable: true,
                  expandedText: "...Collapse",
                  collapsedText: "...Expand",
                  trim: AdvancedTrimmer(
                    length: 150,
                    mode: TrimMode.length,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            AdvancedText(
              "www.google.com\n$text",
              features: const AdvancedTextFeatures(
                hyperlink: Hyperlink(
                  enable: true,
                  style: TextStyle(
                    color: Colors.red,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                readMore: ReadMore(
                  enable: true,
                  expandedText: "...Show less",
                  collapsedText: "...Read more",
                  decoration: ReadMoreDecoration(
                    lessStyle: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trim: AdvancedTrimmer(
                    length: 150,
                    mode: TrimMode.length,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            AdvancedText(
              "www.google.com\n$text",
              features: const AdvancedTextFeatures(
                hyperlink: Hyperlink(
                  enable: true,
                  style: TextStyle(
                    color: Colors.purple,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                readMore: ReadMore(
                  enable: true,
                  expandedText: "...Show less",
                  collapsedText: "...Read more",
                  decoration: ReadMoreDecoration(
                    lessStyle: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trim: AdvancedTrimmer(
                    length: 100,
                    mode: TrimMode.length,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
