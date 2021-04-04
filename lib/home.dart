import 'package:dialog_provider/download_model.dart';
import 'package:dialog_provider/progress_dialog.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dialog Provider'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Download'),
          onPressed: () async {
            _showProgressView(context);

            await context.read<DownloadModel>().download();
            Navigator.pop(context);

            _showSuccessSnackbar(context);
          },
        ),
      ),
    );
  }

  void _showProgressView(BuildContext context) {
    final DownloadModel model =
        Provider.of<DownloadModel>(context, listen: false);
    showGeneralDialog<void>(
      context: context,
      barrierDismissible: false,
      transitionDuration: Duration.zero,
      barrierColor: Colors.black.withOpacity(0.5),
      useRootNavigator: false,
      pageBuilder: (BuildContext context, Animation<void> animation,
          Animation<void> secondaryAnimation) {
        return ChangeNotifierProvider.value(
          value: model,
          child: ProgressDialog(),
        );
      },
    );
  }

  void _showSuccessSnackbar(BuildContext context) {
    Fluttertoast.showToast(
      msg: "ダウンロードが完了しました。",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 2,
    );
  }
}
