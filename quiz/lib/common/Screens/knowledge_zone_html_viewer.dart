import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/parser.dart' as htmlparser;
import 'package:quiz/common/bloc/common_api_bloc.dart';
import 'package:quiz/common/bloc/common_api_events.dart';
import 'package:quiz/common/bloc/common_api_states.dart';
import 'package:quiz/common/database/my_store.dart';
import 'package:quiz/common/database/objectbox_db.dart';
import 'package:quiz/common/model/database_model.dart';
import 'package:quiz/common/resources/strings/value_string.dart';
import 'package:quiz/common/utilities/util.dart';
import 'package:share/share.dart';
import 'package:velocity_x/velocity_x.dart';

class KnowledgeZoneHtmlTextViewer extends StatefulWidget {
  final String dataHash;
  final String title;
  final String subtitle;

  const KnowledgeZoneHtmlTextViewer(
      {Key? key,
      required this.dataHash,
      required this.subtitle,
      required this.title})
      : super(key: key);

  @override
  _KnowledgeZoneHtmlTextViewerState createState() =>
      _KnowledgeZoneHtmlTextViewerState();
}

class _KnowledgeZoneHtmlTextViewerState
    extends State<KnowledgeZoneHtmlTextViewer> {
  late String? content;
  late bool isDone;
  MyStore store = VxState.store;
  CommonApiBloc? commonApiBloc;

  IconButton getIconButton() {
    Query<BookmarkElement> data = store.dataStore
        .box<BookmarkElement>()
        .query(BookmarkElement_.content
            .equals(content!)
            .and(BookmarkElement_.title.equals(widget.title))
            .and(BookmarkElement_.subtitle
                .equals(widget.subtitle.substring(0, 10))))
        .build();
    BookmarkElement? bookmarkElement = data.findFirst();
    data.close();
    if (bookmarkElement == null)
      return IconButton(
          onPressed: () {
            BookmarkElement data = BookmarkElement(
                subtitle: widget.subtitle.substring(0, 10),
                title: widget.title,
                content: content!);
            showCustomSnackBar(context, ValueString.itemBookmarked);

            setState(() {
              store.dataStore.box<BookmarkElement>().put(data);
            });
          },
          icon: const Icon(Icons.bookmark_add_outlined));
    else
      return IconButton(
        onPressed: () {
          showCustomSnackBar(context, ValueString.itemRemoved);
          setState(() {
            store.dataStore.box<BookmarkElement>().remove(bookmarkElement.id!);
          });
        },
        icon: const Icon(Icons.bookmark_remove_outlined),
      );
  }

  @override
  void initState() {
    isDone = false;
    content = '';
    commonApiBloc = BlocProvider.of<CommonApiBloc>(context);
    commonApiBloc!.add(FetchTestDataHashEvent(dataHash: widget.dataHash));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: ListTile(
          contentPadding: const EdgeInsets.all(0),
          title: Text(
            widget.title,
            softWrap: false,
            overflow: TextOverflow.fade,
            style: const TextStyle(fontSize: 20),
          ),
        ),
        actions: [
          isDone
              ? getIconButton()
              : const IconButton(
                  onPressed: null, icon: Icon(Icons.bookmark_outline)),
          IconButton(
              onPressed: isDone
                  ? () {
                      Share.share(
                          htmlparser
                              .parse(
                                content,
                              )
                              .body!
                              .text,
                          subject: widget.title);
                    }
                  : null,
              icon: const Icon(Icons.share))
        ],
      ),
      body: BlocConsumer<CommonApiBloc, CommonApiStates>(
          builder: (context, state) {
        if (state is FetchTestDataHashLoadingState) {
          return buildLoadingIndicator(context, 0);
        }
        if (state is FetchTestDataHashLoadedState) {
          content = state.fetchTestDataHashModel!.content;
          return InteractiveViewer(
            minScale: 1,
            child: ListView(
                padding: EdgeInsets.all(buildWidth(context) * 0.02),
                children: [
                  Html(
                    data: state.fetchTestDataHashModel!.content,
                    onLinkTap: (url, _, __, ___) async {
                      launchInBrowser(url!);
                    },
                  )
                ]),
          );
        }
        return SizedBox.shrink();
      }, listener: (context, state) {
        if (state is FetchTestDataHashLoadedState) {
          setState(() {
            content = state.fetchTestDataHashModel!.content;
            print(content);
            isDone = true;
          });
        }
      }),
    );
  }
}
