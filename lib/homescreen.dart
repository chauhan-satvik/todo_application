import 'package:flutter/material.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  TodoPageState createState() => TodoPageState();
}

class TodoPageState extends State<TodoPage> {
  // Controller for the TextField
  final TextEditingController _controller = TextEditingController();

  // List to store tasks
  final List<String> _tasks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('To-Doish')),
      body: Column(
        children: [
          Expanded(
            child:
                _tasks.isEmpty
                    ? const Center(
                      child: Text(
                        'No tasks yet. Add one below!',
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                    : ListView.builder(
                      itemCount: _tasks.length,
                      itemBuilder: (context, index) {
                        return ListTile(title: Text(_tasks[index]));
                      },
                    ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: _controller,
          decoration: InputDecoration(
            hintText: 'Enter your task...',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final text = _controller.text.trim();
          if (text.isNotEmpty) {
            setState(() {
              _tasks.add(text);
              _controller.clear();
            });
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
