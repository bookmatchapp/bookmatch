import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/favorite_button/favorite_button_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/custom_functions.dart' as functions;
import 'package:sticky_headers/sticky_headers.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';
import 'favorites_grid_model.dart';
export 'favorites_grid_model.dart';

class FavoritesGridWidget extends StatefulWidget {
  const FavoritesGridWidget({super.key});

  @override
  State<FavoritesGridWidget> createState() => _FavoritesGridWidgetState();
}

class _FavoritesGridWidgetState extends State<FavoritesGridWidget> {
  late FavoritesGridModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FavoritesGridModel());

    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      FFAppState().favoriteBooks =
          (currentUserDocument?.favoriteBooks.toList() ?? [])
              .toList()
              .cast<String>();
      safeSetState(() {});
    });

    _model.searchBarTextController ??= TextEditingController();
    _model.searchBarFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<BooksRecord>>(
      stream: queryBooksRecord(
        queryBuilder: (booksRecord) =>
            booksRecord.whereIn('uid', FFAppState().favoriteBooks),
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            body: Center(
              child: SizedBox(
                width: 50.0,
                height: 50.0,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<BooksRecord> favoritesGridBooksRecordList = snapshot.data!;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: AppBar(
              backgroundColor: FlutterFlowTheme.of(context).primary,
              automaticallyImplyLeading: false,
              title: Text(
                'Favorite Books',
                style: FlutterFlowTheme.of(context).titleLarge.override(
                      fontFamily: 'Inter Tight',
                      color: FlutterFlowTheme.of(context).alternate,
                      letterSpacing: 0.0,
                    ),
              ),
              actions: const [],
              centerTitle: false,
              elevation: 2.0,
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  StickyHeader(
                    overlapHeaders: false,
                    header: Container(
                      width: double.infinity,
                      height: 80.0,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).primaryBackground,
                      ),
                      alignment: const AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            16.0, 12.0, 8.0, 12.0),
                        child: TextFormField(
                          controller: _model.searchBarTextController,
                          focusNode: _model.searchBarFocusNode,
                          onChanged: (_) => EasyDebounce.debounce(
                            '_model.searchBarTextController',
                            const Duration(milliseconds: 2000),
                            () async {
                              FFAppState().searchMode = true;
                              safeSetState(() {});
                              if (_model.searchBarTextController.text != '') {
                                safeSetState(() {
                                  _model.simpleSearchResults = TextSearch(
                                    favoritesGridBooksRecordList
                                        .map(
                                          (record) => TextSearchItem.fromTerms(
                                              record, [
                                            record.title,
                                            record.author,
                                            record.genre
                                          ]),
                                        )
                                        .toList(),
                                  )
                                      .search(
                                          _model.searchBarTextController.text)
                                      .map((r) => r.object)
                                      .toList();
                                });
                              } else {
                                FFAppState().searchMode = false;
                                safeSetState(() {});
                              }
                            },
                          ),
                          textCapitalization: TextCapitalization.words,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Search (title, author, genre)',
                            labelStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                            hintStyle: FlutterFlowTheme.of(context)
                                .labelMedium
                                .override(
                                  fontFamily: 'Inter',
                                  letterSpacing: 0.0,
                                ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).alternate,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).primary,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: FlutterFlowTheme.of(context).error,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                            filled: true,
                            fillColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            contentPadding: const EdgeInsetsDirectional.fromSTEB(
                                24.0, 24.0, 20.0, 24.0),
                            prefixIcon: Icon(
                              Icons.search,
                              color: FlutterFlowTheme.of(context).secondaryText,
                              size: 16.0,
                            ),
                            suffixIcon: _model
                                    .searchBarTextController!.text.isNotEmpty
                                ? InkWell(
                                    onTap: () async {
                                      _model.searchBarTextController?.clear();
                                      FFAppState().searchMode = true;
                                      safeSetState(() {});
                                      if (_model.searchBarTextController.text !=
                                          '') {
                                        safeSetState(() {
                                          _model.simpleSearchResults =
                                              TextSearch(
                                            favoritesGridBooksRecordList
                                                .map(
                                                  (record) =>
                                                      TextSearchItem.fromTerms(
                                                          record, [
                                                    record.title,
                                                    record.author,
                                                    record.genre
                                                  ]),
                                                )
                                                .toList(),
                                          )
                                                  .search(_model
                                                      .searchBarTextController
                                                      .text)
                                                  .map((r) => r.object)
                                                  .toList();
                                        });
                                      } else {
                                        FFAppState().searchMode = false;
                                        safeSetState(() {});
                                      }

                                      safeSetState(() {});
                                    },
                                    child: const Icon(
                                      Icons.clear,
                                      color: Color(0xFF757575),
                                      size: 22.0,
                                    ),
                                  )
                                : null,
                          ),
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                          validator: _model.searchBarTextControllerValidator
                              .asValidator(context),
                        ),
                      ),
                    ),
                    content: Stack(
                      children: [
                        if (FFAppState().searchMode == false)
                          Builder(
                            builder: (context) {
                              final allBooks =
                                  favoritesGridBooksRecordList.toList();

                              return GridView.builder(
                                padding: EdgeInsets.zero,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 1.0,
                                  mainAxisSpacing: 1.0,
                                  childAspectRatio: 1.0,
                                ),
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: allBooks.length,
                                itemBuilder: (context, allBooksIndex) {
                                  final allBooksItem = allBooks[allBooksIndex];
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: 80.0,
                                      height: 140.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                      ),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            'BookDetails',
                                            queryParameters: {
                                              'book': serializeParam(
                                                allBooksItem,
                                                ParamType.Document,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'book': allBooksItem,
                                            },
                                          );
                                        },
                                        child: Stack(
                                          children: [
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Hero(
                                                tag: allBooksItem.coverPhoto,
                                                transitionOnUserGestures: true,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                  child: Image.network(
                                                    allBooksItem.coverPhoto,
                                                    width: 80.0,
                                                    height: 140.0,
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            wrapWithModel(
                                              model: _model
                                                  .favoriteButtonModels1
                                                  .getModel(
                                                allBooksItem.reference.id,
                                                allBooksIndex,
                                              ),
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              updateOnChange: true,
                                              child: FavoriteButtonWidget(
                                                key: Key(
                                                  'Key6gy_${allBooksItem.reference.id}',
                                                ),
                                                selected: functions
                                                    .checkIfBookIsInTheFavorites(
                                                        allBooksItem
                                                            .reference.id),
                                                onSelected: () async {
                                                  await currentUserReference!
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'favoriteBooks':
                                                            FieldValue
                                                                .arrayUnion([
                                                          allBooksItem
                                                              .reference.id
                                                        ]),
                                                      },
                                                    ),
                                                  });
                                                  FFAppState()
                                                      .addToFavoriteBooks(
                                                          allBooksItem
                                                              .reference.id);
                                                  safeSetState(() {});
                                                },
                                                onUnSelected: () async {
                                                  await currentUserReference!
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'favoriteBooks':
                                                            FieldValue
                                                                .arrayRemove([
                                                          allBooksItem
                                                              .reference.id
                                                        ]),
                                                      },
                                                    ),
                                                  });
                                                  FFAppState()
                                                      .removeFromFavoriteBooks(
                                                          allBooksItem
                                                              .reference.id);
                                                  safeSetState(() {});
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        if (FFAppState().searchMode == true)
                          Builder(
                            builder: (context) {
                              final searchResults =
                                  _model.simpleSearchResults.toList();

                              return GridView.builder(
                                padding: EdgeInsets.zero,
                                gridDelegate:
                                    const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  crossAxisSpacing: 1.0,
                                  mainAxisSpacing: 1.0,
                                  childAspectRatio: 1.0,
                                ),
                                shrinkWrap: true,
                                scrollDirection: Axis.vertical,
                                itemCount: searchResults.length,
                                itemBuilder: (context, searchResultsIndex) {
                                  final searchResultsItem =
                                      searchResults[searchResultsIndex];
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: 80.0,
                                      height: 140.0,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius:
                                            BorderRadius.circular(0.0),
                                      ),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            'BookDetails',
                                            queryParameters: {
                                              'book': serializeParam(
                                                searchResultsItem,
                                                ParamType.Document,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'book': searchResultsItem,
                                            },
                                          );
                                        },
                                        child: Stack(
                                          children: [
                                            Align(
                                              alignment: const AlignmentDirectional(
                                                  0.0, 0.0),
                                              child: Hero(
                                                tag: searchResultsItem
                                                    .coverPhoto,
                                                transitionOnUserGestures: true,
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                  child: Image.network(
                                                    searchResultsItem
                                                        .coverPhoto,
                                                    width: 80.0,
                                                    height: 140.0,
                                                    fit: BoxFit.contain,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            wrapWithModel(
                                              model: _model
                                                  .favoriteButtonModels2
                                                  .getModel(
                                                searchResultsItem.reference.id,
                                                searchResultsIndex,
                                              ),
                                              updateCallback: () =>
                                                  safeSetState(() {}),
                                              updateOnChange: true,
                                              child: FavoriteButtonWidget(
                                                key: Key(
                                                  'Keyohq_${searchResultsItem.reference.id}',
                                                ),
                                                selected: functions
                                                    .checkIfBookIsInTheFavorites(
                                                        searchResultsItem
                                                            .reference.id),
                                                onSelected: () async {
                                                  await currentUserReference!
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'favoriteBooks':
                                                            FieldValue
                                                                .arrayUnion([
                                                          searchResultsItem
                                                              .reference.id
                                                        ]),
                                                      },
                                                    ),
                                                  });
                                                  FFAppState()
                                                      .addToFavoriteBooks(
                                                          searchResultsItem
                                                              .reference.id);
                                                  safeSetState(() {});
                                                },
                                                onUnSelected: () async {
                                                  await currentUserReference!
                                                      .update({
                                                    ...mapToFirestore(
                                                      {
                                                        'favoriteBooks':
                                                            FieldValue
                                                                .arrayRemove([
                                                          searchResultsItem
                                                              .reference.id
                                                        ]),
                                                      },
                                                    ),
                                                  });
                                                  FFAppState()
                                                      .removeFromFavoriteBooks(
                                                          searchResultsItem
                                                              .reference.id);
                                                  safeSetState(() {});
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
