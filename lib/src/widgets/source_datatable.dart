import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:leaderboard/src/models/sources_model.dart';

class SourceDataTable extends StatelessWidget {
  const SourceDataTable({super.key, required this.sourcesData});

  final List<SourceModel> sourcesData;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return DataTable(
      // dataRowMaxHeight: size.height * 0.07,
      horizontalMargin: 0,
      dividerThickness: 0.1,
      columns: const <DataColumn>[
        DataColumn(
          label: Expanded(
            child: Text(
              'Place',
              style:
                  TextStyle(fontStyle: FontStyle.italic, color: Colors.white),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Photo',
              style:
                  TextStyle(fontStyle: FontStyle.italic, color: Colors.white),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'name',
              style:
                  TextStyle(fontStyle: FontStyle.italic, color: Colors.white),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Position',
              style:
                  TextStyle(fontStyle: FontStyle.italic, color: Colors.white),
            ),
          ),
        ),
        DataColumn(
          label: Expanded(
            child: Text(
              'Leads',
              style:
                  TextStyle(fontStyle: FontStyle.italic, color: Colors.white),
            ),
          ),
        ),
      ],
      rows: _sourceStaticData(sourcesData, size),
    );
  }

  List<DataRow> _sourceStaticData(List<SourceModel> sources, Size size) {
    List<DataRow> data = [];

    for (var i = 0; i < sources.length; i++) {
      var source = sources[i];
      data.add(
        DataRow(
          cells: [
            DataCell(
              Text(
                source.place.toString(),
                style: TextStyle(
                    color: Colors.white, fontSize: size.height * 0.02),
              ),
            ),
            DataCell(
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 2),
                child: Center(
                  child: ClipOval(
                    child: SizedBox(
                      height: size.height * 0.05,
                      width: size.height * 0.05,
                      child: CachedNetworkImage(
                        imageUrl: source.photo,
                        filterQuality: FilterQuality.high,
                        fit: BoxFit
                            .cover, // Asegurarse de que la imagen cubra completamente el área
                        placeholder: (context, url) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                        errorWidget: (context, url, error) => Image.asset(
                          'assets/no_user.png',
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            DataCell(
              Text(
                source.sourceName,
                style: TextStyle(
                    color: Colors.white, fontSize: size.height * 0.02),
              ),
            ),
            DataCell(Text(
              // source.week1,
              source.position.name,
              style:
                  TextStyle(color: Colors.white, fontSize: size.height * 0.02),
            )),
            DataCell(Text(
              // source.week2,
              source.leadCount.toString(),
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
