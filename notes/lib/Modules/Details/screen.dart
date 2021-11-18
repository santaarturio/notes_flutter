import 'package:flutter/material.dart';
import 'package:notes/Model/note_model.dart';

class DetailsProps {
  final Note? note;
  final void Function(String title, String subtitle) create;
  final void Function() back;
  final bool isDownloading;

  DetailsProps(
      {required this.note,
      required this.create,
      required this.back,
      required this.isDownloading});
}

class DetailsScreen extends StatefulWidget {
  final DetailsProps props;

  const DetailsScreen({Key? key, required this.props}) : super(key: key);

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final _titleController = TextEditingController();
  final _subtitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
            title: Text(widget.props.note != null ? 'Details' : 'Create',
                style: const TextStyle(fontSize: 18)),
            centerTitle: true,
            backgroundColor: Colors.white,
            foregroundColor: Colors.amber,
            leading: BackButton(onPressed: () => widget.props.back()),
            actions: [_doneButton()]),
        body: _body());
  }

  _createNote() {
    final bool? isValid = _formKey.currentState?.validate();

    if (isValid ?? false) {
      widget.props.create(_titleController.text, _subtitleController.text);
    }
  }

  String? _validator(String? value) {
    return (value ?? "").trim().isEmpty
        ? "This field should not be empty"
        : null;
  }

  _doneButton() {
    return Visibility(
      visible: widget.props.note == null,
      child: Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: GestureDetector(
              onTap: _createNote, child: const Icon(Icons.done, size: 26.0))),
    );
  }

  _body() {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
          child: Column(
            children: [
              _progressView(),
              _titleTextField(),
              _subtitleTextField()
            ],
          ),
        ),
      ),
    );
  }

  _progressView() {
    return Visibility(
        visible: widget.props.isDownloading,
        child: const CircularProgressIndicator());
  }

  _titleTextField() {
    _titleController.text = _titleController.text.isEmpty
        ? widget.props.note?.title ?? ''
        : _titleController.text;

    return TextFormField(
        validator: _validator,
        controller: _titleController,
        enabled: widget.props.note == null,
        maxLines: null,
        style: const TextStyle(fontSize: 24),
        decoration: const InputDecoration(hintText: 'Enter Title'));
  }

  _subtitleTextField() {
    _subtitleController.text = _subtitleController.text.isEmpty
        ? widget.props.note?.subtitle ?? ''
        : _subtitleController.text;

    return TextFormField(
        validator: _validator,
        controller: _subtitleController,
        enabled: widget.props.note == null,
        maxLines: null,
        style: const TextStyle(fontSize: 20),
        decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: 'Enter Subtitle',
            errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.red))));
  }
}
