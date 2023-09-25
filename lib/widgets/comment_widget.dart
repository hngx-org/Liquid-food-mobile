import 'package:flutter/material.dart';
import '../utils/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';
// This file is for the comment widget
// It's a simple and self explanatory widget

class CommentWidget extends StatefulWidget {
  final String initialCommentText;
  final TextEditingController? commentController;

  const CommentWidget({
    Key? key,
    required this.initialCommentText,
    this.commentController,
  }) : super(key: key);

  @override
  CommentWidgetState createState() => CommentWidgetState();
}

class CommentWidgetState extends State<CommentWidget> {
  String commentText = '';
  bool isEditing = false;

  @override
  void initState() {
    super.initState();
    commentText = widget.initialCommentText;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isEditing = true;
        });
      },
      child: Container(
        width: double.infinity,
        height: 126,
        padding: const EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15,
        ),
        decoration: BoxDecoration(
          color: AppColors.commentBackground,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppColors.tShadeColor,
            width: 1,
          ),
        ),
        child: isEditing
            ? TextField(
                onTapOutside: (event) =>
                    FocusScope.of(context).requestFocus(FocusNode()),
                style: const TextStyle(
                  color: Colors.black,
                ),
                decoration: const InputDecoration(border: InputBorder.none),
                maxLines: null,
                onChanged: (value) {
                  setState(() {
                    commentText = value;
                  });
                },
              )
            : Text(
                commentText,
                style: GoogleFonts.workSans(
                  color: AppColors.tBlack,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
      ),
    );
  }
}
