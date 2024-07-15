import 'package:flutter/material.dart';
import 'package:leaderboard/src/data/source_static_data.dart';
import 'package:leaderboard/src/models/source_model.dart';

class SourceDataTable extends StatelessWidget {
  const SourceDataTable({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return DataTable(
      columns: const <DataColumn>[
        DataColumn(
          label: Expanded(
            child: Text(
              'ID',
              style:
                  TextStyle(fontStyle: FontStyle.italic, color: Colors.white),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Name',
              style:
                  TextStyle(fontStyle: FontStyle.italic, color: Colors.white),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'July',
              style:
                  TextStyle(fontStyle: FontStyle.italic, color: Colors.white),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'week1',
              style:
                  TextStyle(fontStyle: FontStyle.italic, color: Colors.white),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'week2',
              style:
                  TextStyle(fontStyle: FontStyle.italic, color: Colors.white),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'week3',
              style:
                  TextStyle(fontStyle: FontStyle.italic, color: Colors.white),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'week4',
              style:
                  TextStyle(fontStyle: FontStyle.italic, color: Colors.white),
            ),
          ),
        ),
      ],
      rows: _sourceStaticData(sources, size),
    );
  }

  List<DataRow> _sourceStaticData(List<SourceModel> sources, Size size) {
    List<DataRow> data = [];

    for (var source in sources) {
      data.add(
        DataRow(
          cells: [
            DataCell(Text(
              source.id,
              style:
                  TextStyle(color: Colors.white, fontSize: size.height * 0.02),
            )),
            DataCell(Text(
              source.fullName,
              style:
                  TextStyle(color: Colors.white, fontSize: size.height * 0.02),
            )),
            DataCell(Text(
              source.month,
              style:
                  TextStyle(color: Colors.white, fontSize: size.height * 0.02),
            )),
            DataCell(Text(
              source.week1,
              style:
                  TextStyle(color: Colors.white, fontSize: size.height * 0.02),
            )),
            DataCell(Text(
              source.week2,
              style:
                  TextStyle(color: Colors.white, fontSize: size.height * 0.02),
            )),
            DataCell(Text(
              source.week3,
              style:
                  TextStyle(color: Colors.white, fontSize: size.height * 0.02),
            )),
            DataCell(Text(
              source.week4,
              style:
                  TextStyle(color: Colors.white, fontSize: size.height * 0.02),
            )),
          ],
        ),
      );
    }

    return data;
  }
}
