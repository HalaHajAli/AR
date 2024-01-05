import 'package:flutter/material.dart';
import 'package:arcore_flutter_plugin/arcore_flutter_plugin.dart';
import 'package:vector_math/vector_math.dart' show Vector3;

class MyArCorePage extends StatefulWidget {
  @override
  _MyArCorePageState createState() => _MyArCorePageState();
}

class _MyArCorePageState extends State<MyArCorePage> {
  late ArCoreController _arCoreController; // Make ArCoreController nullable

  @override
  void initState() {
    super.initState();
  }

  void _initializeArCore(ArCoreController controller) {
    _arCoreController = controller;

    // Perform initialization logic
    _addSphere();
  }

  @override
  void dispose() {
    _arCoreController.dispose();
    super.dispose();
  }

  void _addSphere() {
  final sphereNode = ArCoreNode(
    shape: ArCoreSphere(
      materials: [ArCoreMaterial(color: Colors.blue)],
      radius: 0.1,
    ),
    position: null, // Use null for nullable Vector3?
  );

  _arCoreController.addArCoreNode(sphereNode);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ARCore Example'),
      ),
      body: ArCoreView(
        onArCoreViewCreated: (controller) {
          _initializeArCore(controller);
        },
        enableUpdateListener: true,
      ),
    );
  }
}
