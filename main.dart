// Placeholder for Flutter Web4 integration logic using three_js,
// google_generative_ai, and http for IPFS retrieval.
// See documentation for implementing Scene setup and AI analysis.
import 'package:flutter/material.dart';
import 'package:flutter_ipfs/flutter_ipfs.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:flutter_ipfs/flutter_ipfs.dart';
import 'dart:js_interop';
import 'dart:js' as js;
import 'package:flutter_js/flutter_js.dart';

Future<void> executeJsOnMobile() async {
  // 1. Create the runtime
  final JavascriptRuntime jsRuntime = getJavascriptRuntime();

  // 2. Define your JavaScript logic
  String jsCode = """
    function add(a, b) {
      return a + b;
    }
    add(10, 5);
  """;

  // 3. Evaluate the code
  JsEvalResult result = await jsRuntime.evaluate(jsCode);
  
  // 4. Use the result
  print("Result of 10 + 5: ${result.stringResult}"); // 15
  
  // 5. Clean up
  jsRuntime.dispose();
}

void callQuickJs() {
  // Access global window methods directly
  js.context.callMethod('alert', ['Quick Alert!']);
  
  // Access console
  js.context['console'].callMethod('log', ['Logged from Dart']);
}

// Define the binding to the JS function
@JS('myWeb4Action')
external String callWeb4Action(String data);

void main() {
  final result = callWeb4Action("Advanced Web Input");
  print(result); // Outputs: Success
}
// In Dart
jsRuntime.onMessage('notifyFlutter', (dynamic args) {
  print('Message received from JS: $args');
});

// In JavaScript
// sendMessage('notifyFlutter', JSON.stringify({ "status": "ok" }));

void uploadToWeb4() async {
  final cid = await FlutterIpfs().uploadFile('path/to/data.json');
  print('Content ID (CID): $cid'); // Use this to retrieve data globally
}

final model = GenerativeModel(model: 'gemini-1.5-flash', apiKey: 'YOUR_API_KEY');

Future<void> askAi(String prompt) async {
  final content = [Content.text(prompt)];
  final response = await model.generateContent(content);
  print('AI: ${response.text}');
}

class Web4Dashboard extends StatefulWidget {
  @override
  _Web4DashboardState createState() => _Web4DashboardState();
}

class _Web4DashboardState extends State<Web4Dashboard> {
  String aiResponse = "Waiting for AI...";
  String ipfsStatus = "Ready";

  // 1. IPFS - Upload/Retrieve decentralized data
  Future<void> handleIPFS() async {
    final cid = await FlutterIpfs().uploadFile('data.json');
    setState(() => ipfsStatus = "Stored at CID: $cid");
  }

  // 2. AI - Process data using Generative AI
  Future<void> runAIAnalysis() async {
    final model = GenerativeModel(model: 'gemini-1.5-flash', apiKey: 'YOUR_API_KEY');
    final response = await model.generateContent([Content.text("Analyze this Web4 data.")]);
    setState(() => aiResponse = response.text ?? "No response");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Web4 Flutter App")),
      body: Column(
        children: [
          // 3. 3D Graphics - High-performance visualization
          Expanded(
            flex: 2,
            child: ModelViewer(
              backgroundColor: Colors.black12,
              src: 'https://modelviewer.dev',
              alt: "A 3D model retrieved for Web4",
              autoRotate: true,
              cameraControls: true,
            ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                children: [
                  Text("IPFS: $ipfsStatus"),
                  SizedBox(height: 10),
                  Text("AI Agent: $aiResponse"),
                  ElevatedButton(onPressed: runAIAnalysis, child: Text("Run AI")),
                  ElevatedButton(onPressed: handleIPFS, child: Text("Save to IPFS")),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
