/**
 * 検索タイプ
 */
enum SearchType {
  FREEWORD,
  USERID,
}

/**
 * 検索タイプの拡張
 */
extension TypeExtension on SearchType {
  static final searchNames = {
    SearchType.FREEWORD: 'フリーワード',
    SearchType.USERID: 'ユーザーID',
  };

  String? get getSearchName => searchNames[this];

  static final searchIds = {
    SearchType.FREEWORD: 0,
    SearchType.USERID: 1,
  };

  int? get getSearchId => searchIds[this];

  static final searchTypeList = [SearchType.FREEWORD, SearchType.USERID];

  List<SearchType>? get getSearchTypeList => searchTypeList;
}

/**
 * 検索画面のテキストフォームのエラーステート
 */
enum SearchErrorType{
  DONE,
  EMPTY,
  NOT_ALPHANUMERIC
}

/**
 * 検索画面のテキストフォームのエラーリソース
 */
extension ErrorTypeExtension on SearchErrorType {
  static final errorMessages = {
    SearchErrorType.EMPTY: '調べたいQitaIDを入力してください',
    SearchErrorType.NOT_ALPHANUMERIC: '英数字または記号のみで入力してください',
  };

  String? get errorMessage => errorMessages[this];
}