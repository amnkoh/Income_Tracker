import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/app/home/job_entries/job_entries_page.dart';
import 'package:flutter_course/app/home/jobs/edit_job_page.dart';
import 'package:flutter_course/app/home/jobs/job_list_tile.dart';
import 'package:flutter_course/app/home/jobs/list_items_builder.dart';
import 'package:flutter_course/app/home/models/job.dart';
import 'package:flutter_course/common_widgets/show_exception_alert_dialog.dart';
import 'package:flutter_course/services/database.dart';
import 'package:provider/provider.dart';
class JobsPage extends StatelessWidget {

  Future<void> _delete(BuildContext context, Job job) async{
    try {
      final database = Provider.of<Database>(context,listen: false);
      await database.deleteJob(job);
    } on FirebaseException catch (e) {
      showExceptionAlertDialog(
          context,
          title: 'Operation Failed!',
          exception: e
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Jobs'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add,color: Colors.white,),
              onPressed: () => EditJobPage.show(
                  context,
                  database: Provider.of<Database>(context,listen: false))
          ),
        ],
      ),
      body: _buildContents(context),
      );
  }

 Widget _buildContents(BuildContext context) {
    final database = Provider.of<Database>(context,listen: false);
    return StreamBuilder<List<Job>>(
        stream: database.jobsStream(),
        builder: (context,snapshot) {
          return ListItemsBuilder<Job>(
            snapshot: snapshot,
            itemBuilder: (context,job) => Dismissible(
              key: Key('Job-${job.id}'),
              background: Container(color: Colors.red,),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) => _delete(context,job),
              child: JobListTile(
                job: job,
                onTap: () => JobEntriesPage.show(context,job),
              ),
            ),
          );
        },
    );
 }
}
