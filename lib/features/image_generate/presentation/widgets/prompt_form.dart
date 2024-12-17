import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myapp/core/widgets/input.dart';
import 'package:myapp/features/image_generate/presentation/bloc/word_image_bloc.dart';
import 'package:myapp/features/image_generate/presentation/bloc/word_image_event.dart';

class PromptForm extends StatefulWidget {
  final String word;
  const PromptForm({super.key, required this.word});

  @override
  State<PromptForm> createState() => _PromptFormState();

}

class _PromptFormState extends State<PromptForm> {
  final TextEditingController _promptInputController = TextEditingController();
  String _selectedOption = "google_image";

  @override 
  void initState() {
    super.initState();
    _promptInputController.text = widget.word;
  }

  @override  
  void dispose() {
    _promptInputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomInputField(
            label: "",
            prefixIcon: Icons.search,
            placeholder: "Search an Image to visualize the word",
            keyboardType: TextInputType.text,
            maxLines: 1,
            controller: _promptInputController,
          ),
          const SizedBox(height: 16),
          const Text(
            "Choose Image Source:",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: RadioListTile<String>(
                  title: const Text("Google Image"),
                  value: "google_image",
                  groupValue: _selectedOption,
                  onChanged: (value) {
                    setState(() {
                      _selectedOption = value!;
                    });
                  },
                ),
              ),
              Expanded(
                child: RadioListTile<String>(
                  title: const Text("AI Generated"),
                  value: "ai_generated_image",
                  groupValue: _selectedOption,
                  onChanged: (value) {
                    setState(() {
                      _selectedOption = value!;
                    });
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              onPressed: () {
                final word = _promptInputController.text.trim();
                if (word.isNotEmpty) {
                  context
                      .read<RemoteWordImagesBloc>()
                      .add(GetWordImagesEvent(word: word));
                }
              },
              icon: const Icon(Icons.auto_awesome),
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
