import 'package:dialog_provider/download_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProgressDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double progress = context.watch<DownloadModel>().progress;

    return AlertDialog(
      backgroundColor: Colors.transparent,
      elevation: 0,
      content: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircularProgressIndicator(value: progress),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: LinearProgressIndicator(value: progress),
            ),
            Text(
              '${(progress * 100).toStringAsFixed(1)}%',
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
