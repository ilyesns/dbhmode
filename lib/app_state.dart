import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static final FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _favorite = (await secureStorage.getStringList('ff_favorite'))
              ?.map((path) => path.ref)
              .toList() ??
          _favorite;
    });
    await _safeInitAsync(() async {
      _cartsum = await secureStorage.getDouble('ff_cartsum') ?? _cartsum;
    });
    await _safeInitAsync(() async {
      _color = await secureStorage.getString('ff_color') ?? _color;
    });
    await _safeInitAsync(() async {
      _cart = (await secureStorage.getStringList('ff_cart'))
              ?.map((path) => path.ref)
              .toList() ??
          _cart;
    });
    await _safeInitAsync(() async {
      _privacyPolicy =
          await secureStorage.getBool('ff_privacyPolicy') ?? _privacyPolicy;
    });
    products = await queryProductRecordOnce();
    homeImages = await queryHomeImagesRecordOnce();
    categories = await queryCategoriesRecordOnce();
    subCategories = await querySubCategoriesRecordOnce();
    variants = await queryVariantsRecordOnce();
    colors = await queryColorsRecordOnce();
    sizes = await querySizesRecordOnce();
    discounts = await queryDiscountsRecordOnce();
  }

  late List<ProductRecord> _products;
  List<ProductRecord> get products => _products;
  set products(products) => _products = products;

  late List<HomeImagesRecord> _homeImages;
  List<HomeImagesRecord> get homeImages => _homeImages;
  set homeImages(homeImages) => _homeImages = homeImages;

  late List<CategoriesRecord> _categories;
  List<CategoriesRecord> get categories => _categories;
  set categories(categories) => _categories = categories;

  late List<SubCategoriesRecord> _subCategories;
  List<SubCategoriesRecord> get subCategories => _subCategories;
  set subCategories(subCategories) => _subCategories = subCategories;

  late List<VariantsRecord> _variants;
  List<VariantsRecord> get variants => _variants;
  set variants(variants) => _variants = variants;

  late List<ColorsRecord> _colors;
  List<ColorsRecord> get colors => _colors;
  set colors(colors) => _colors = colors;

  late List<SizesRecord> _sizes;
  List<SizesRecord> get sizes => _sizes;
  set sizes(sizes) => _sizes = sizes;

  late List<DiscountsRecord> _discounts;
  List<DiscountsRecord> get discounts => _discounts;
  set discounts(discounts) => _discounts = discounts;

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  List<DocumentReference> _favorite = [];
  List<DocumentReference> get favorite => _favorite;
  set favorite(List<DocumentReference> _value) {
    _favorite = _value;
    secureStorage.setStringList(
        'ff_favorite', _value.map((x) => x.path).toList());
  }

  void deleteFavorite() {
    secureStorage.delete(key: 'ff_favorite');
  }

  void addToFavorite(DocumentReference _value) {
    _favorite.add(_value);
    secureStorage.setStringList(
        'ff_favorite', _favorite.map((x) => x.path).toList());
  }

  void removeFromFavorite(DocumentReference _value) {
    _favorite.remove(_value);
    secureStorage.setStringList(
        'ff_favorite', _favorite.map((x) => x.path).toList());
  }

  void removeAtIndexFromFavorite(int _index) {
    _favorite.removeAt(_index);
    secureStorage.setStringList(
        'ff_favorite', _favorite.map((x) => x.path).toList());
  }

  void updateFavoriteAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _favorite[_index] = updateFn(_favorite[_index]);
    secureStorage.setStringList(
        'ff_favorite', _favorite.map((x) => x.path).toList());
  }

  double _cartsum = 0;
  double get cartsum => _cartsum;
  set cartsum(double _value) {
    _cartsum = _value;
    secureStorage.setDouble('ff_cartsum', _value);
  }

  void deleteCartsum() {
    secureStorage.delete(key: 'ff_cartsum');
  }

  int _size = 1;
  int get size => _size;
  set size(int _value) {
    _size = _value;
  }

  String _color = '';
  String get color => _color;
  set color(String _value) {
    _color = _value;
    secureStorage.setString('ff_color', _value);
  }

  void deleteColor() {
    secureStorage.delete(key: 'ff_color');
  }

  bool _searchonof = false;
  bool get searchonof => _searchonof;
  set searchonof(bool _value) {
    _searchonof = _value;
  }

  bool _toggleFavorite = false;
  bool get toggleFavorite => _toggleFavorite;
  set toggleFavorite(bool _value) {
    _toggleFavorite = _value;
  }

  List<DocumentReference> _cart = [];
  List<DocumentReference> get cart => _cart;
  set cart(List<DocumentReference> _value) {
    _cart = _value;
    secureStorage.setStringList('ff_cart', _value.map((x) => x.path).toList());
  }

  void deleteCart() {
    secureStorage.delete(key: 'ff_cart');
  }

  void addToCart(DocumentReference _value) {
    _cart.add(_value);
    secureStorage.setStringList('ff_cart', _cart.map((x) => x.path).toList());
  }

  void removeFromCart(DocumentReference _value) {
    _cart.remove(_value);
    secureStorage.setStringList('ff_cart', _cart.map((x) => x.path).toList());
  }

  void removeAtIndexFromCart(int _index) {
    _cart.removeAt(_index);
    secureStorage.setStringList('ff_cart', _cart.map((x) => x.path).toList());
  }

  void updateCartAtIndex(
    int _index,
    DocumentReference Function(DocumentReference) updateFn,
  ) {
    _cart[_index] = updateFn(_cart[_index]);
    secureStorage.setStringList('ff_cart', _cart.map((x) => x.path).toList());
  }

  bool _showfulllistproduct = false;
  bool get showfulllistproduct => _showfulllistproduct;
  set showfulllistproduct(bool _value) {
    _showfulllistproduct = _value;
  }

  DocumentReference? _subcategoryRef;
  DocumentReference? get subcategoryRef => _subcategoryRef;
  set subcategoryRef(DocumentReference? _value) {
    _subcategoryRef = _value;
  }

  String _Gender = 'women';
  String get Gender => _Gender;
  set Gender(String _value) {
    _Gender = _value;
  }

  DocumentReference? _refreshSubQueryCahe;
  DocumentReference? get refreshSubQueryCahe => _refreshSubQueryCahe;
  set refreshSubQueryCahe(DocumentReference? _value) {
    _refreshSubQueryCahe = _value;
  }

  bool _privacyPolicy = false;
  bool get privacyPolicy => _privacyPolicy;
  set privacyPolicy(bool _value) {
    _privacyPolicy = _value;
    secureStorage.setBool('ff_privacyPolicy', _value);
  }

  void deletePrivacyPolicy() {
    secureStorage.delete(key: 'ff_privacyPolicy');
  }

  final _productItemManager = FutureRequestManager<ProductRecord>();
  Future<ProductRecord> productItem({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<ProductRecord> Function() requestFn,
  }) =>
      _productItemManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearProductItemCache() => _productItemManager.clear();
  void clearProductItemCacheKey(String? uniqueKey) =>
      _productItemManager.clearRequest(uniqueKey);

  final _listProductCacheManager = StreamRequestManager<List<ProductRecord>>();
  Stream<List<ProductRecord>> listProductCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<ProductRecord>> Function() requestFn,
  }) =>
      _listProductCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearListProductCacheCache() => _listProductCacheManager.clear();
  void clearListProductCacheCacheKey(String? uniqueKey) =>
      _listProductCacheManager.clearRequest(uniqueKey);

  final _subCategoriesCacheManager =
      StreamRequestManager<List<SubCategoriesRecord>>();
  Stream<List<SubCategoriesRecord>> subCategoriesCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<SubCategoriesRecord>> Function() requestFn,
  }) =>
      _subCategoriesCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearSubCategoriesCacheCache() => _subCategoriesCacheManager.clear();
  void clearSubCategoriesCacheCacheKey(String? uniqueKey) =>
      _subCategoriesCacheManager.clearRequest(uniqueKey);

  final _categoriesCacheManager =
      StreamRequestManager<List<CategoriesRecord>>();
  Stream<List<CategoriesRecord>> categoriesCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<CategoriesRecord>> Function() requestFn,
  }) =>
      _categoriesCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearCategoriesCacheCache() => _categoriesCacheManager.clear();
  void clearCategoriesCacheCacheKey(String? uniqueKey) =>
      _categoriesCacheManager.clearRequest(uniqueKey);

  final _priceCacheManager = FutureRequestManager<DiscountsRecord>();
  Future<DiscountsRecord> priceCache({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Future<DiscountsRecord> Function() requestFn,
  }) =>
      _priceCacheManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearPriceCacheCache() => _priceCacheManager.clear();
  void clearPriceCacheCacheKey(String? uniqueKey) =>
      _priceCacheManager.clearRequest(uniqueKey);
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
