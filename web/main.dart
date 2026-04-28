import 'package:flutter/material.dart';
import 'package:flutter_ipfs/flutter_ipfs.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

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
