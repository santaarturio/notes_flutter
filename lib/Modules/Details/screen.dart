import 'package:flutter/material.dart';
import 'package:notes/Model/note.dart';

class DetailsProps {
  final Note? note;
  final void Function(String title, String subtitle) create;
  final void Function() back;
  final bool isDownloading;

  DetailsProps({
    required this.note,
    required this.create,
    required this.back,
    required this.isDownloading,
  });
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

  _createNote() {
    final bool? isValid = _formKey.currentState?.validate();

    if (isValid ?? false) {
      widget.props.create(_titleController.text, _subtitleController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
          appBar: AppBar(
              title: Text(widget.props.note != null ? 'Details' : 'Create'),
              centerTitle: true,
              leading: BackButton(onPressed: widget.props.back),
              actions: [
                Visibility(
                    visible: widget.props.note == null,
                    child: IconButton(
                      onPressed: _createNote,
                      icon: const Icon(Icons.done, size: 26.0),
                    ))
              ]),
          body: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 32),
                child: Column(
                  children: [
                    Visibility(
                      visible: widget.props.isDownloading,
                      child: const CircularProgressIndicator(),
                    ),
                    _TextFormField(
                      controller: _titleController,
                      controllerText:
                          widget.props.note?.title ?? _titleController.text,
                      hintText: 'Enter Title',
                      enabled: widget.props.note == null,
                      isTitle: true,
                    ),
                    _TextFormField(
                      controller: _subtitleController,
                      controllerText: widget.props.note?.subtitle ??
                          _subtitleController.text,
                      hintText: 'Enter Subtitle',
                      enabled: widget.props.note == null,
                      isTitle: false,
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}

class _TextFormField extends StatelessWidget {
  final TextEditingController controller;
  final String controllerText;
  final String hintText;
  final bool isTitle;
  final bool enabled;

  const _TextFormField({
    Key? key,
    required this.controller,
    required this.controllerText,
    required this.hintText,
    required this.isTitle,
    required this.enabled,
  }) : super(key: key);

  String? _validator(String? value) {
    return (value ?? "").trim().isEmpty
        ? "This field should not be empty"
        : null;
  }

  @override
  Widget build(BuildContext context) {
    controller.text = controllerText;

    return TextFormField(
      validator: _validator,
      controller: controller,
      enabled: enabled,
      maxLines: null,
      style: isTitle
          ? Theme.of(context).textTheme.headline1
          : Theme.of(context).textTheme.headline2,
      decoration: isTitle
          ? InputDecoration(hintText: hintText)
          : InputDecoration(
              border: InputBorder.none,
              hintText: hintText,
              errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Theme.of(context).errorColor),
              ),
            ),
    );
  }
}
