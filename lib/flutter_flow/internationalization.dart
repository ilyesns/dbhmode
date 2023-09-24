import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'fr', 'ar', 'it'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? frText = '',
    String? arText = '',
    String? itText = '',
  }) =>
      [enText, frText, arText, itText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    final language = locale.toString();
    return FFLocalizations.languages().contains(
      language.endsWith('_')
          ? language.substring(0, language.length - 1)
          : language,
    );
  }

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // initialPage
  {
    'y62fmp4l': {
      'en': 'NEW COLLECTION',
      'ar': 'مجموعة جديدة',
      'fr': 'NOUVELLE COLLECTION',
      'it': 'NUOVA COLLEZIONE',
    },
    'yzme2868': {
      'en': 'Discover our new release',
      'ar': 'اكتشف إصدارنا الجديد',
      'fr': 'Découvrez notre nouvelle version',
      'it': 'Scopri la nostra nuova versione',
    },
    't1680r0h': {
      'en': 'Login',
      'ar': 'تسجيل الدخول',
      'fr': 'Connexion',
      'it': 'Login',
    },
    '0pb1qa9p': {
      'en': 'Create an account',
      'ar': 'إنشاء حساب',
      'fr': 'Créer un compte',
      'it': 'Creare un account',
    },
    '6pzdc445': {
      'en': 'Skip for now',
      'ar': 'تخطي في الوقت الراهن',
      'fr': 'Ignorer pour l\'instant',
      'it': 'Salta per ora',
    },
    'rle9cezp': {
      'en': 'Privacy Policy',
      'ar': 'سياسة الخصوصية',
      'fr': 'politique de confidentialité',
      'it': 'politica sulla riservatezza',
    },
    'rr2xm5ik': {
      'en': 'Discover our latest collections news and inspirations.',
      'ar': 'اكتشف أحدث مجموعاتنا الأخبار والإلهام.',
      'fr': 'Découvrez nos dernières nouveautés collections et inspirations.',
      'it': 'Scopri le novità e le ispirazioni delle nostre ultime collezioni.',
    },
    'qn4a1ec3': {
      'en': 'Agree and Started',
      'ar': 'الموافقة والبدء',
      'fr': 'D\'accord et commencé',
      'it': 'Accetto e Iniziato',
    },
    '8lt7xzpl': {
      'en':
          'By clicking \"Agree and Started\", you have read and agreed to the \"Privacy Policy\"  of DBH MODE',
      'ar':
          'بالنقر فوق \"موافق وبدأت\" ، تكون قد قرأت ووافقت على \"سياسة الخصوصية\" الخاصة بـ DBH MODE',
      'fr':
          'En cliquant sur \"Accepter et commencer\", vous avez lu et accepté la \"Politique de confidentialité\" de DBH MODE',
      'it':
          'Facendo clic su \"Accetta e inizia\", ​​hai letto e accettato la \"Politica sulla privacy\" di DBH MODE',
    },
    'owylllht': {
      'en': 'Privacy Policy',
      'ar': 'سياسة الخصوصية',
      'fr': 'politique de confidentialité',
      'it': 'politica sulla riservatezza',
    },
    'c8krdeil': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // Home
  {
    't3gs1u4z': {
      'en': 'Trends',
      'ar': '',
      'fr': '',
      'it': '',
    },
    'v29u9fxp': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // Shop
  {
    'j5rrpnvo': {
      'en': 'Shop',
      'ar': 'محل',
      'fr': 'Boutique',
      'it': 'Negozio',
    },
  },
  // FAVORITE
  {
    'fh0csfrp': {
      'en': 'Looks like you don\'t have any favorites yet !',
      'ar': 'يبدو أنه ليس لديك أي مفضلات حتى الآن!',
      'fr': 'Il semble que vous n\'ayez pas encore de favoris !',
      'it': 'Sembra che tu non abbia ancora nessun preferito!',
    },
    '16rcfchb': {
      'en': 'Browse our products to your favorite one.',
      'ar': 'تصفح منتجاتنا إلى منتجك المفضل.',
      'fr': 'Parcourez nos produits jusqu\'à votre préféré.',
      'it': 'Sfoglia i nostri prodotti fino a quello che preferisci.',
    },
    'k0gk2o9q': {
      'en': 'Browse Our Products',
      'ar': 'تصفح منتجاتنا',
      'fr': 'Parcourir nos produits',
      'it': 'Sfoglia i nostri prodotti',
    },
    'xtelhfn9': {
      'en': 'Favorite',
      'ar': 'مفضل',
      'fr': 'Préféré',
      'it': 'Preferito',
    },
  },
  // CART
  {
    'fy7710e6': {
      'en': 'Below is the list of items in your cart.',
      'ar': 'أدناه قائمة العناصر في عربة التسوق الخاصة بك.',
      'fr': 'Ci-dessous la liste des articles de votre panier.',
      'it': 'Di seguito è riportato l\'elenco degli articoli nel carrello.',
    },
    '0yuhku3m': {
      'en': 'Looks like you don\'t have any cart item yet !',
      'ar': 'يبدو أنه ليس لديك أي عنصر في سلة التسوق حتى الآن!',
      'fr':
          'Il semble que vous n\'ayez pas encore d\'article dans votre panier !',
      'it': 'Sembra che tu non abbia ancora nessun articolo nel carrello!',
    },
    'dok7otra': {
      'en': 'Browse our products to your cart one.',
      'ar': 'تصفح منتجاتنا إلى عربة التسوق الخاصة بك.',
      'fr': 'Parcourez nos produits jusqu\'à votre panier.',
      'it': 'Sfoglia i nostri prodotti nel tuo carrello uno.',
    },
    'trjh0p8w': {
      'en': 'Total',
      'ar': 'المجموع',
      'fr': 'Total',
      'it': 'Totale',
    },
    's3dihui4': {
      'en': 'Browse Our Products',
      'ar': 'تصفح منتجاتنا',
      'fr': 'Parcourir nos produits',
      'it': 'Sfoglia i nostri prodotti',
    },
    'zr3znh5x': {
      'en': 'Order Now',
      'ar': 'اطلب الان',
      'fr': 'Commandez maintenant',
      'it': 'Ordina adesso',
    },
    'b5spsln8': {
      'en': 'Please login ',
      'ar': 'الرجاء تسجيل الدخول',
      'fr': 'Veuillez vous connecter',
      'it': 'Accedere prego',
    },
    'rvjppqj0': {
      'en': 'Cart',
      'ar': 'عربة التسوق',
      'fr': 'Chariot',
      'it': 'Carrello',
    },
  },
  // ShopSubCategories
  {
    '9vmxa4vl': {
      'en': 'Favorite',
      'ar': 'مفضل',
      'fr': 'Préféré',
      'it': 'Preferito',
    },
  },
  // ListProducts
  {
    'du7i6mm8': {
      'en': 'Sort',
      'ar': 'نوع',
      'fr': 'Trier',
      'it': 'Ordinare',
    },
    'f6wz34xd': {
      'en': 'Filter',
      'ar': 'منقي',
      'fr': 'Filtre',
      'it': 'Filtro',
    },
    'ny1vbubk': {
      'en': 'Favorite',
      'ar': 'مفضل',
      'fr': 'Préféré',
      'it': 'Preferito',
    },
  },
  // Product_Item
  {
    '8ptb3cor': {
      'en': 'Size',
      'ar': 'مقاس',
      'fr': 'Taille',
      'it': 'Misurare',
    },
    'jkwtzrsi': {
      'en': 'Description',
      'ar': 'ديكريبتيون',
      'fr': 'Description',
      'it': 'Descrizione',
    },
    'sb0p75j0': {
      'en': 'Size',
      'ar': 'مقاس',
      'fr': 'Taille',
      'it': 'Misurare',
    },
    'l1yik07p': {
      'en': 'Decription',
      'ar': 'ديكريبتيون',
      'fr': 'Description',
      'it': 'Descrizione',
    },
    'ft5wclk3': {
      'en': 'YOU WILL LIKE ALSO',
      'ar': 'سوف يعجبك أيضًا',
      'fr': 'VOUS AIMEREZ AUSSI',
      'it': 'TI PIACEREBBE ANCHE',
    },
    'dxjgw4v5': {
      'en': 'Remainder',
      'ar': 'بقية',
      'fr': 'Solde',
      'it': 'Resto',
    },
    'gafcf7sv': {
      'en': 'Add to cart',
      'ar': 'أضف إلى السلة',
      'fr': 'Ajouter au panier',
      'it': 'Aggiungi al carrello',
    },
    'td7itrg7': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // AuthPage
  {
    'rnmwb59w': {
      'en': 'Create Account',
      'ar': 'إنشاء حساب',
      'fr': 'Créer un compte',
      'it': 'Creare un account',
    },
    '6zf1fni8': {
      'en': 'Create Account',
      'ar': 'إنشاء حساب',
      'fr': 'Créer un compte',
      'it': 'Creare un account',
    },
    'vuzoegu1': {
      'en': 'Let\'s get started by filling out the form below.',
      'ar': 'لنبدأ بملء النموذج أدناه.',
      'fr': 'Commençons par remplir le formulaire ci-dessous.',
      'it': 'Iniziamo compilando il modulo sottostante.',
    },
    '60sn1y2i': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
      'fr': 'E-mail',
      'it': 'E-mail',
    },
    'ypehbe05': {
      'en': 'Password',
      'ar': 'كلمة المرور',
      'fr': 'Mot de passe',
      'it': 'Parola d\'ordine',
    },
    'd86klkyv': {
      'en': 'Re-write password',
      'ar': 'أعد كتابة كلمة المرور',
      'fr': 'Réécrire le mot de passe',
      'it': 'Riscrivi la password',
    },
    'vwcj1j20': {
      'en': 'Get Started',
      'ar': 'البدء',
      'fr': 'Commencer',
      'it': 'Iniziare',
    },
    'a202n10m': {
      'en': 'Or sign up with',
      'ar': 'أو اشترك مع',
      'fr': 'Ou inscrivez-vous avec',
      'it': 'Oppure iscriviti con',
    },
    'u501w2lr': {
      'en': 'Continue with Google',
      'ar': 'تواصل مع جوجل',
      'fr': 'Continuer avec Google',
      'it': 'Continua con Google',
    },
    'zbm4huzi': {
      'en': 'Continue with Apple',
      'ar': 'تواصل مع أبل',
      'fr': 'Continuer avec Apple',
      'it': 'Continua con Apple',
    },
    'tq4flesx': {
      'en': 'Privacy Policy',
      'ar': 'سياسة الخصوصية',
      'fr': 'politique de confidentialité',
      'it': 'politica sulla riservatezza',
    },
    'zh8om3qb': {
      'en': 'Log In',
      'ar': 'تسجيل الدخول',
      'fr': 'Connexion',
      'it': 'Login',
    },
    'ug8qumj0': {
      'en': 'Welcome Back',
      'ar': 'مرحبًا بعودتك',
      'fr': 'Content de te revoir',
      'it': 'Bentornato',
    },
    'drk0n1yu': {
      'en': 'Fill out the information below in order to access your account.',
      'ar': 'املأ المعلومات أدناه للوصول إلى حسابك.',
      'fr':
          'Remplissez les informations ci-dessous afin d\'accéder à votre compte.',
      'it': 'Compila le informazioni di seguito per accedere al tuo account.',
    },
    'to7hh89i': {
      'en': 'Email',
      'ar': 'بريد إلكتروني',
      'fr': 'E-mail',
      'it': 'E-mail',
    },
    'pcy6qahz': {
      'en': 'Password',
      'ar': 'كلمة المرور',
      'fr': 'Mot de passe',
      'it': 'Parola d\'ordine',
    },
    'gfied55b': {
      'en': 'Sign In',
      'ar': 'تسجيل الدخول',
      'fr': 'S\'identifier',
      'it': 'Registrazione',
    },
    'm7dlr7xk': {
      'en': 'Or sign in with',
      'ar': 'أو قم بتسجيل الدخول باستخدام',
      'fr': 'Ou connectez-vous avec',
      'it': 'Oppure accedi con',
    },
    '83dfusmt': {
      'en': 'Continue with Google',
      'ar': 'تواصل مع جوجل',
      'fr': 'Continuer avec Google',
      'it': 'Continua con Google',
    },
    '5lfo70wy': {
      'en': 'Continue with Apple',
      'ar': 'تواصل مع أبل',
      'fr': 'Continuer avec Apple',
      'it': 'Continua con Apple',
    },
    '9u93csik': {
      'en': 'Forgot Password?',
      'ar': 'هل نسيت كلمة السر؟',
      'fr': 'Mot de passe oublié?',
      'it': 'Ha dimenticato la password?',
    },
    'nbzfgsp8': {
      'en': 'Privacy Policy',
      'ar': 'سياسة الخصوصية',
      'fr': 'politique de confidentialité',
      'it': 'politica sulla riservatezza',
    },
    'qkrz1z98': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // ProfileTeam
  {
    'cn2lec6f': {
      'en': 'Account',
      'ar': 'حساب',
      'fr': 'Compte',
      'it': 'Account',
    },
    'qp3374hp': {
      'en': 'Edit Profile',
      'ar': 'تعديل الملف الشخصي',
      'fr': 'Editer le profil',
      'it': 'Modifica Profilo',
    },
    'aa6hyru9': {
      'en': 'Go to Dashbord',
      'ar': 'اذهب إلى داشبورد',
      'fr': 'Aller au tableau de bord',
      'it': 'Vai a Dashboard',
    },
    '8t21ktgq': {
      'en': 'General',
      'ar': 'عام',
      'fr': 'Général',
      'it': 'Generale',
    },
    '5eigoz1z': {
      'en': 'Switch to Dark Mode',
      'ar': 'قم بالتبديل إلى الوضع الداكن',
      'fr': 'Passer en mode sombre',
      'it': 'Passa alla modalità oscura',
    },
    'fqzgc26d': {
      'en': 'Switch to Light Mode',
      'ar': 'قم بالتبديل إلى وضع الإضاءة',
      'fr': 'Passer en mode lumière',
      'it': 'Passa alla modalità Luce',
    },
    'wfrbw8fq': {
      'en': 'Privacy Policy',
      'ar': 'سياسة الخصوصية',
      'fr': 'politique de confidentialité',
      'it': 'politica sulla riservatezza',
    },
    'x4m3ovji': {
      'en': 'Log out',
      'ar': 'تسجيل خروج',
      'fr': 'Se déconnecter',
      'it': 'Disconnettersi',
    },
    'lvrltxnm': {
      'en': 'Log in',
      'ar': 'تسجيل الدخول',
      'fr': 'Connexion',
      'it': 'Login',
    },
    '8kgvxyiu': {
      'en': 'Profile',
      'ar': 'حساب تعريفي',
      'fr': 'Profil',
      'it': 'Profilo',
    },
  },
  // SearchPage
  {
    'gv3gsx2l': {
      'en': 'Search',
      'ar': 'يبحث',
      'fr': 'Recherche',
      'it': 'Ricerca',
    },
    'km56iobu': {
      'en': 'DBH',
      'ar': 'DBH',
      'fr': 'DBH',
      'it': 'DBH',
    },
    '5u5xe4od': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // Dashbord_admin
  {
    'cieo8lpq': {
      'en': 'Management ',
      'ar': 'إدارة',
      'fr': 'Gestion',
      'it': 'Gestione',
    },
    '8y5s52tg': {
      'en': 'Manage Products',
      'ar': 'إدارة المنتجات',
      'fr': 'Gérer les produits',
      'it': 'Gestisci prodotti',
    },
    'epf4p6en': {
      'en': 'Manage Orders',
      'ar': 'إدارة الطلبات',
      'fr': 'Gérer les commandes',
      'it': 'Gestisci gli ordini',
    },
    'zosvplky': {
      'en': 'Go back home',
      'ar': 'ارجع ',
      'fr': 'Retourner ',
      'it': 'Torna ',
    },
    'l8xte4p9': {
      'en': 'Profile',
      'ar': 'حساب تعريفي',
      'fr': 'Profil',
      'it': 'Profilo',
    },
  },
  // ManageProducts
  {
    'vv3tdi6n': {
      'en': 'Manage Products',
      'ar': 'إدارة المنتجات',
      'fr': 'Gérer les produits',
      'it': 'Gestisci prodotti',
    },
    'woackaop': {
      'en': 'Your products are below',
      'ar': 'المنتجات الخاصة بك أدناه',
      'fr': 'Vos produits sont ci-dessous',
      'it': 'I tuoi prodotti sono sotto',
    },
    'p57pdo41': {
      'en': '1',
      'ar': '1',
      'fr': '1',
      'it': '1',
    },
    '6nknf2qg': {
      'en': 'Add Product / Category / Variants',
      'ar': 'أضف المنتج / الفئة / المتغيرات',
      'fr': 'Ajouter un produit / une catégorie / des variantes',
      'it': 'Aggiungi prodotto/categoria/varianti',
    },
    'iulxytz3': {
      'en': 'Category',
      'ar': 'فئة',
      'fr': 'Catégorie',
      'it': 'Categoria',
    },
    'tvglxzt7': {
      'en': 'Sub category',
      'ar': 'تصنيف فرعي',
      'fr': 'Sous catégorie',
      'it': 'Sottocategoria',
    },
    '5nygfbw0': {
      'en': 'Product',
      'ar': 'منتج',
      'fr': 'Produit',
      'it': 'Prodotto',
    },
    '5t5ndudt': {
      'en': 'Variant',
      'ar': 'متغير',
      'fr': 'Une variante',
      'it': 'Variante',
    },
    '7fp7hx4l': {
      'en': 'Brand',
      'ar': 'ماركة',
      'fr': 'Marque',
      'it': 'Marca',
    },
    'orbhmbky': {
      'en': 'Discount',
      'ar': 'تخفيض',
      'fr': 'Rabais',
      'it': 'Sconto',
    },
    'jq7k762m': {
      'en': 'Promotion',
      'ar': 'ترقية',
      'fr': 'Promotion',
      'it': 'Promozione',
    },
    'aseo8d20': {
      'en': 'Home image',
      'ar': 'الصورة الرئيسية',
      'fr': 'Image d\'accueil',
      'it': 'Immagine domestica',
    },
    'fjgnajyg': {
      'en': 'Recent Products',
      'ar': 'المنتجات الأخيرة',
      'fr': 'Produits recents',
      'it': 'Prodotti recenti',
    },
    '21wz1lbm': {
      'en': 'A list of all your products ',
      'ar': 'قائمة بجميع منتجاتك',
      'fr': 'Une liste de tous vos produits',
      'it': 'Un elenco di tutti i tuoi prodotti',
    },
    'c5uaj5pb': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // ManageOrders
  {
    'b4egnigi': {
      'en': 'Manage Orders',
      'ar': 'إدارة الطلبات',
      'fr': 'Gérer les commandes',
      'it': 'Gestisci gli ordini',
    },
    'v014flda': {
      'en': 'Your orders are below',
      'ar': 'أوامرك أدناه',
      'fr': 'Vos commandes ci-dessous',
      'it': 'I tuoi ordini sono sotto',
    },
    'en48h07m': {
      'en': '1',
      'ar': '1',
      'fr': '1',
      'it': '1',
    },
    '1e1r7bcz': {
      'en': 'Pending',
      'ar': 'قيد الانتظار',
      'fr': 'En attente',
      'it': 'In attesa di',
    },
    '25jx0qnv': {
      'en': 'User name oder',
      'ar': 'اسم المستخدم اودير',
      'fr': 'Nom d\'utilisateur',
      'it': 'Nome utente oder',
    },
    'ymoya1np': {
      'en': 'Number of item example 3 ',
      'ar': 'رقم مثال العنصر 3',
      'fr': 'Numéro d\'article exemple 3',
      'it': 'Numero di articolo esempio 3',
    },
    'uijoe3ky': {
      'en': 'Ordered at',
      'ar': 'طلب في',
      'fr': 'Commandé à',
      'it': 'Ordinato a',
    },
    'sb13835o': {
      'en': 'Tuesday, 10:00am',
      'ar': 'الثلاثاء ، 10:00 صباحا',
      'fr': 'mardi, 10h00',
      'it': 'Martedì, 10:00',
    },
    'hzlae3gc': {
      'en': 'In Progress',
      'ar': 'في تَقَدم',
      'fr': 'En cours',
      'it': 'In corso',
    },
    'qnq61xly': {
      'en': 'Name',
      'ar': 'اسم',
      'fr': 'Nom',
      'it': 'Nome',
    },
    'okji1n72': {
      'en': 'User name oder',
      'ar': 'اسم المستخدم اودير',
      'fr': 'Nom d\'utilisateur',
      'it': 'Nome utente oder',
    },
    'gkicm0xy': {
      'en': 'Number of item example 3 ',
      'ar': 'رقم مثال العنصر 3',
      'fr': 'Numéro d\'article exemple 3',
      'it': 'Numero di articolo esempio 3',
    },
    'qj6r0zrg': {
      'en': 'Ordered at',
      'ar': 'طلب في',
      'fr': 'Commandé à',
      'it': 'Ordinato a',
    },
    'thac94l1': {
      'en': 'Tuesday, 10:00am',
      'ar': 'الثلاثاء ، 10:00 صباحا',
      'fr': 'mardi, 10h00',
      'it': 'Martedì, 10:00',
    },
    '7z7acyn5': {
      'en': 'In Progress',
      'ar': 'في تَقَدم',
      'fr': 'En cours',
      'it': 'In corso',
    },
    's4lgz4yf': {
      'en': 'Name',
      'ar': 'اسم',
      'fr': 'Nom',
      'it': 'Nome',
    },
    'ouxagbwz': {
      'en': 'Completed',
      'ar': 'مكتمل',
      'fr': 'Complété',
      'it': 'Completato',
    },
    'd63whhaq': {
      'en': 'User name oder',
      'ar': 'اسم المستخدم اودير',
      'fr': 'Nom d\'utilisateur',
      'it': 'Nome utente oder',
    },
    'lfqqrjc0': {
      'en': 'Number of item example 3 ',
      'ar': 'رقم مثال العنصر 3',
      'fr': 'Numéro d\'article exemple 3',
      'it': 'Numero di articolo esempio 3',
    },
    '0tmdsmk7': {
      'en': 'Ordered at',
      'ar': 'طلب في',
      'fr': 'Commandé à',
      'it': 'Ordinato a',
    },
    '2cfi8cbg': {
      'en': 'Tuesday, 10:00am',
      'ar': 'الثلاثاء ، 10:00 صباحا',
      'fr': 'mardi, 10h00',
      'it': 'Martedì, 10:00',
    },
    'yla686ph': {
      'en': 'In Progress',
      'ar': 'في تَقَدم',
      'fr': 'En cours',
      'it': 'In corso',
    },
    '52vv2u71': {
      'en': 'Name',
      'ar': 'اسم',
      'fr': 'Nom',
      'it': 'Nome',
    },
    'd021ujdg': {
      'en': 'User name oder',
      'ar': 'اسم المستخدم اودير',
      'fr': 'Nom d\'utilisateur',
      'it': 'Nome utente oder',
    },
    'rbg2jwrl': {
      'en': 'Number of item example 3 ',
      'ar': 'رقم مثال العنصر 3',
      'fr': 'Numéro d\'article exemple 3',
      'it': 'Numero di articolo esempio 3',
    },
    'ipuk4c7q': {
      'en': 'Ordered at',
      'ar': 'طلب في',
      'fr': 'Commandé à',
      'it': 'Ordinato a',
    },
    'bnt0tsgu': {
      'en': 'Tuesday, 10:00am',
      'ar': 'الثلاثاء ، 10:00 صباحا',
      'fr': 'mardi, 10h00',
      'it': 'Martedì, 10:00',
    },
    'h22wrc58': {
      'en': 'In Progress',
      'ar': 'في تَقَدم',
      'fr': 'En cours',
      'it': 'In corso',
    },
    'f1c9sgss': {
      'en': 'Name',
      'ar': 'اسم',
      'fr': 'Nom',
      'it': 'Nome',
    },
    '909121jf': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // editProfile
  {
    'egqaoklb': {
      'en': 'Edit Profile',
      'ar': 'تعديل الملف الشخصي',
      'fr': 'Editer le profil',
      'it': 'Modifica Profilo',
    },
    'yhg3zvmy': {
      'en': 'Change Photo',
      'ar': 'غير الصوره',
      'fr': 'Changer la photo',
      'it': 'Cambia foto',
    },
    'xcotfn8f': {
      'en': 'Your Name',
      'ar': 'اسمك',
      'fr': 'votre nom',
      'it': 'Il tuo nome',
    },
    '8xw75yni': {
      'en': 'Please enter a valid number...',
      'ar': 'من فضلك أدخل رقما صالحا...',
      'fr': 'S\'il vous plait, entrez un nombre valide...',
      'it': 'Per favore, inserire un numero valido...',
    },
    'j9s3m8dl': {
      'en': 'Phone Number',
      'ar': 'رقم التليفون',
      'fr': 'Numéro de téléphone',
      'it': 'Numero di telefono',
    },
    'wkagk3jz': {
      'en': 'Your phone number',
      'ar': 'رقم تليفونك',
      'fr': 'Votre numéro de téléphone',
      'it': 'Il tuo numero di telefono',
    },
    '0aa8uvyf': {
      'en': 'Address',
      'ar': 'عنوان',
      'fr': 'Adresse',
      'it': 'Indirizzo',
    },
    'dx7ss2f1': {
      'en': 'Your address',
      'ar': 'عنوانك',
      'fr': 'Votre adresse',
      'it': 'Il tuo indirizzo',
    },
    'ql4qb0wu': {
      'en': 'Save Changes',
      'ar': 'حفظ التغييرات',
      'fr': 'Sauvegarder les modifications',
      'it': 'Salvare le modifiche',
    },
    '0kr84n80': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // ManageTeams
  {
    'umh74tl0': {
      'en': 'Manage Team',
      'ar': 'إدارة الفريق',
      'fr': 'Gérer l\'équipe',
      'it': 'Gestisci squadra',
    },
    'en7tdnk6': {
      'en': 'Your team are below',
      'ar': 'فريقك أدناه',
      'fr': 'Votre équipe est ci-dessous',
      'it': 'La tua squadra è sotto',
    },
    '14hcpnud': {
      'en': '1',
      'ar': '1',
      'fr': '1',
      'it': '1',
    },
    'fsjad8k0': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': 'Maison',
      'it': 'Casa',
    },
  },
  // AddSubCategory
  {
    '31tud7or': {
      'en': 'Create Sub Category',
      'ar': 'إنشاء فئة فرعية',
      'fr': 'Créer une sous-catégorie',
      'it': 'Crea sottocategoria',
    },
    'svaygq8f': {
      'en': 'Please enter the information below to add a sub category.',
      'ar': 'الرجاء إدخال المعلومات أدناه لإضافة فئة فرعية.',
      'fr':
          'Veuillez saisir les informations ci-dessous pour ajouter une sous-catégorie.',
      'it':
          'Inserisci le informazioni di seguito per aggiungere una sottocategoria.',
    },
    'woxh4331': {
      'en': 'Add Photo',
      'ar': 'إضافة صورة',
      'fr': 'Ajouter une photo',
      'it': 'Aggiungi foto',
    },
    'v7atcd9j': {
      'en': 'Please upload an image!',
      'ar': 'الرجاء تحميل صورة!',
      'fr': 'Veuillez télécharger une image !',
      'it': 'Si prega di caricare un\'immagine!',
    },
    'guutl0wt': {
      'en': 'Sub Category\'s Name',
      'ar': 'اسم الفئة الفرعية',
      'fr': 'Nom de la sous-catégorie',
      'it': 'Nome della sottocategoria',
    },
    'qx8gxhkk': {
      'en':
          'Apologies, the subcategory name you\'ve provided already exists in our system. Please try a different name for the subcategory. !',
      'ar':
          'معذرة ، اسم الفئة الفرعية الذي قدمته موجود بالفعل في نظامنا. الرجاء محاولة اسم مختلف للفئة الفرعية. !',
      'fr':
          'Désolé, le nom de la sous-catégorie que vous avez fourni existe déjà dans notre système. Veuillez essayer un nom différent pour la sous-catégorie. !',
      'it':
          'Ci scusiamo, il nome della sottocategoria che hai fornito esiste già nel nostro sistema. Prova un nome diverso per la sottocategoria. !',
    },
    'p92zsk4w': {
      'en': 'Please select a category..',
      'ar': 'الرجاء تحديد الفئة..',
      'fr': 'Veuillez sélectionner une catégorie..',
      'it': 'Seleziona una categoria..',
    },
    'qafr9vj0': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر ...',
      'fr': 'Rechercher un article...',
      'it': 'Cerca un articolo...',
    },
    'ypeijile': {
      'en': 'Please select a category!',
      'ar': 'الرجاء تحديد الفئة!',
      'fr': 'Veuillez sélectionner une catégorie!',
      'it': 'Seleziona una categoria!',
    },
    'soq6idmb': {
      'en': 'List of sub category',
      'ar': 'قائمة الفئات الفرعية',
      'fr': 'Liste des sous-catégories',
      'it': 'Elenco delle sottocategorie',
    },
    'n5g7z8r2': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'fr': 'Annuler',
      'it': 'Annulla',
    },
    '6nreyrni': {
      'en': 'Create',
      'ar': 'يخلق',
      'fr': 'Créer',
      'it': 'Creare',
    },
    'ke3dl5yn': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fr': 'Champ requis',
      'it': 'Il campo è obbligatiorio',
    },
    '1o8vws7c': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء تحديد خيار من القائمة المنسدلة',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'it': 'Scegli un\'opzione dal menu a discesa',
    },
  },
  // payok
  {
    '5bbqgb54': {
      'en': 'Thank You',
      'ar': 'شكرًا لك',
      'fr': 'Merci',
      'it': 'Grazie',
    },
    'y6ejlxec': {
      'en': 'Ok',
      'ar': 'نعم',
      'fr': 'D\'accord',
      'it': 'OK',
    },
  },
  // addToCart
  {
    '8vlkb1rb': {
      'en': 'You added a new product',
      'ar': 'قمت بإضافة منتج جديد',
      'fr': 'Vous avez ajouté un nouveau produit',
      'it': 'Hai aggiunto un nuovo prodotto',
    },
    '5ypnexff': {
      'en': 'Ok',
      'ar': 'نعم',
      'fr': 'D\'accord',
      'it': 'OK',
    },
  },
  // AddProductVariant
  {
    'o47nrjnh': {
      'en': 'Please enter the information below to add a variant.',
      'ar': 'الرجاء إدخال المعلومات أدناه لإضافة متغير.',
      'fr':
          'Veuillez entrer les informations ci-dessous pour ajouter une variante.',
      'it': 'Inserisci le informazioni di seguito per aggiungere una variante.',
    },
    '7spzx1qs': {
      'en': '1',
      'ar': '1',
      'fr': '1',
      'it': '1',
    },
    'k48ma4z6': {
      'en': 'Add a image',
      'ar': 'أضف صورة',
      'fr': 'Ajouter une image',
      'it': 'Aggiungi un\'immagine',
    },
    'k48ma4q6': {
      'en': 'Update frame image',
      'ar': 'تحديث إطار الصورة',
      'fr': 'Mettre à jour le cadre de l\'image',
      'it': 'Aggiorna la cornice dell\'immagine',
    },
    'k48ma4q7': {
      'en': 'Reset',
      'ar': 'إعادة ضبط',
      'fr': 'Réinitialiser',
      'it': 'Ripristina',
    },
    'n7eldqji': {
      'en': 'Color',
      'ar': 'لون',
      'fr': 'Couleur',
      'it': 'Colore',
    },
    'y1hzkma0': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر ...',
      'fr': 'Rechercher un article...',
      'it': 'Cerca un articolo...',
    },
    '5mmf325c': {
      'en': '2',
      'ar': '2',
      'fr': '2',
      'it': '2',
    },
    '36ep191z': {
      'en': 'Size',
      'ar': 'مقاس',
      'fr': 'Taille',
      'it': 'Misurare',
    },
    'xl9e37xg': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر ...',
      'fr': 'Rechercher un article...',
      'it': 'Cerca un articolo...',
    },
    '4e5q9zif': {
      'en': '3',
      'ar': '3',
      'fr': '3',
      'it': '3',
    },
    'm7tcuh9w': {
      'en': 'Quantity',
      'ar': 'كمية',
      'fr': 'Quantité',
      'it': 'Quantità',
    },
    '9qtgvpr3': {
      'en': '4',
      'ar': '4',
      'fr': '4',
      'it': '4',
    },
    'df74p6ug': {
      'en': 'Consult variants',
      'ar': 'استشر المتغيرات',
      'fr': 'Consulter les variantes',
      'it': 'Consulta le varianti',
    },
    'fq9vsiwd': {
      'en': '5',
      'ar': '5',
      'fr': '5',
      'it': '5',
    },
    'bsggwlv6': {
      'en': 'Create Variant',
      'ar': 'إنشاء متغير',
      'fr': 'Créer une variante',
      'it': 'Crea variante',
    },
    'hzkk5tqy': {
      'en': 'For discount check is box.',
      'ar': 'للحصول على مربع الاختيار الخصم.',
      'fr': 'Pour la réduction, cochez la case.',
      'it': 'Per lo sconto il controllo è la casella.',
    },
    'vng5q9ew': {
      'en': 'Discount\'s name',
      'ar': 'اسم الخصم',
      'fr': 'Nom de la réduction',
      'it': 'Nome dello sconto',
    },
    '6i91nhxg': {
      'en': 'Discount\'s description',
      'ar': 'وصف الخصم',
      'fr': 'Description de la remise',
      'it': 'Descrizione dello sconto',
    },
    'hmai5eyk': {
      'en': 'Discount percent',
      'ar': 'نسبة الخصم',
      'fr': 'Pourcentage de remise',
      'it': 'Percentuale di sconto',
    },
    '88e3kzcy': {
      'en': 'Check This If discount is active',
      'ar': 'تحقق من هذا إذا كان الخصم نشطًا',
      'fr': 'Cochez ceci si la réduction est active',
      'it': 'Seleziona questo se lo sconto è attivo',
    },
    'ckjzia5p': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fr': 'Champ requis',
      'it': 'Il campo è obbligatiorio',
    },
    '3mx01kdg': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء تحديد خيار من القائمة المنسدلة',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'it': 'Scegli un\'opzione dal menu a discesa',
    },
    'tudjgklb': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fr': 'Champ requis',
      'it': 'Il campo è obbligatiorio',
    },
    'k2oc6wa0': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء تحديد خيار من القائمة المنسدلة',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'it': 'Scegli un\'opzione dal menu a discesa',
    },
    'h83nb113': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fr': 'Champ requis',
      'it': 'Il campo è obbligatiorio',
    },
    'n5e7jiw8': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء تحديد خيار من القائمة المنسدلة',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'it': 'Scegli un\'opzione dal menu a discesa',
    },
    '0k45mlln': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'fr': 'Annuler',
      'it': 'Annulla',
    },
    'j1rxh0ho': {
      'en': 'Add/Update discount',
      'ar': 'إضافة / تحديث الخصم',
      'fr': 'Ajouter/Mettre à jour la réduction',
      'it': 'Aggiungi/Aggiorna sconto',
    },
  },
  // AddVariant
  {
    'v7ymx7d2': {
      'en': 'Create Variant',
      'ar': 'إنشاء متغير',
      'fr': 'Créer une variante',
      'it': 'Crea variante',
    },
    'o97ri6sp': {
      'en': 'Please enter the information below to add a variant.',
      'ar': 'الرجاء إدخال المعلومات أدناه لإضافة متغير.',
      'fr':
          'Veuillez entrer les informations ci-dessous pour ajouter une variante.',
      'it': 'Inserisci le informazioni di seguito per aggiungere una variante.',
    },
    'n2ly62k5': {
      'en': 'New color :',
      'ar': 'لون جديد :',
      'fr': 'Nouvelle couleur :',
      'it': 'Nuovo colore:',
    },
    'gmfpw9bs': {
      'en': 'Color name',
      'ar': 'اسم اللون',
      'fr': 'Nom de la couleur',
      'it': 'Nome del colore',
    },
    'k9rs1kqi': {
      'en': 'Choose a color',
      'ar': 'اختيار اللون',
      'fr': 'Choisir une couleur',
      'it': 'Scegli un colore',
    },
    'x8nxrg4v': {
      'en': 'Create  color',
      'ar': 'خلق اللون',
      'fr': 'Créer de la couleur',
      'it': 'Crea colore',
    },
    'd62vb1z2': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fr': 'Champ requis',
      'it': 'Il campo è obbligatiorio',
    },
    'ktx82hgi': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء تحديد خيار من القائمة المنسدلة',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'it': 'Scegli un\'opzione dal menu a discesa',
    },
    'utamnycz': {
      'en': 'New size:',
      'ar': 'الحجم الجديد:',
      'fr': 'Nouvelle taille :',
      'it': 'Nuova dimensione:',
    },
    'wbpkhc7r': {
      'en': 'Set size',
      'ar': 'اضبط الحجم',
      'fr': 'Définir la taille',
      'it': 'Imposta dimensione',
    },
    'jvp51k4c': {
      'en': 'CREATE SIZE',
      'ar': 'إنشاء الحجم',
      'fr': 'CRÉER TAILLE',
      'it': 'CREA TAGLIA',
    },
    'ip5csz7t': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fr': 'Champ requis',
      'it': 'Il campo è obbligatiorio',
    },
    'pvtvzbqx': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء تحديد خيار من القائمة المنسدلة',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'it': 'Scegli un\'opzione dal menu a discesa',
    },
  },
  // AddCategory
  {
    'k2b9des5': {
      'en': 'Create Category',
      'ar': 'إنشاء فئة',
      'fr': 'Créer une catégorie',
      'it': 'Crea categoria',
    },
    'u31hbjz9': {
      'en': 'Please enter the information below to add a category.',
      'ar': 'الرجاء إدخال المعلومات أدناه لإضافة فئة.',
      'fr':
          'Veuillez entrer les informations ci-dessous pour ajouter une catégorie.',
      'it':
          'Inserisci le informazioni di seguito per aggiungere una categoria.',
    },
    'y4ribkvm': {
      'en': 'Add Photo',
      'ar': 'إضافة صورة',
      'fr': 'Ajouter une photo',
      'it': 'Aggiungi foto',
    },
    'spirhbcs': {
      'en': 'Please upload an image!',
      'ar': 'الرجاء تحميل صورة!',
      'fr': 'Veuillez télécharger une image !',
      'it': 'Si prega di caricare un\'immagine!',
    },
    'uy55rl93': {
      'en': 'Category\'s Name',
      'ar': 'اسم الفئة',
      'fr': 'Nom de la catégorie',
      'it': 'Nome della categoria',
    },
    'n1pyo3qu': {
      'en': '',
      'ar': '',
      'fr': '',
      'it': '',
    },
    'g9ohfjpp': {
      'en':
          'Apologies, the category name you\'ve provided already exists in our system. Please try a different name for the subcategory. !',
      'ar':
          'عذرًا ، اسم الفئة الذي قدمته موجود بالفعل في نظامنا. الرجاء محاولة اسم مختلف للفئة الفرعية. !',
      'fr':
          'Toutes nos excuses, le nom de catégorie que vous avez fourni existe déjà dans notre système. Veuillez essayer un nom différent pour la sous-catégorie. !',
      'it':
          'Ci scusiamo, il nome della categoria che hai fornito esiste già nel nostro sistema. Prova un nome diverso per la sottocategoria. !',
    },
    'xn5ojhg0': {
      'en': 'Women',
      'ar': 'نحيف',
      'fr': 'Femmes',
      'it': 'Donne',
    },
    'sbzz8u7q': {
      'en': 'Men',
      'ar': 'رجال',
      'fr': 'Hommes',
      'it': 'Uomini',
    },
    'epiiiwue': {
      'en': 'Please select a gender',
      'ar': 'الرجاء تحديد الجنس',
      'fr': 'Veuillez sélectionner un sexe',
      'it': 'Seleziona un sesso',
    },
    'vsmj3maj': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر ...',
      'fr': 'Rechercher un article...',
      'it': 'Cerca un articolo...',
    },
    'ns33spo6': {
      'en': 'Please select a gender!',
      'ar': 'الرجاء تحديد الجنس!',
      'fr': 'Veuillez sélectionner un sexe !',
      'it': 'Seleziona un genere!',
    },
    '6elflf1j': {
      'en': 'List of category',
      'ar': 'قائمة الفئة',
      'fr': 'Liste de catégorie',
      'it': 'Elenco di categoria',
    },
    'xmzr45wn': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'fr': 'Annuler',
      'it': 'Annulla',
    },
    'juyhgyux': {
      'en': 'Create',
      'ar': 'يخلق',
      'fr': 'Créer',
      'it': 'Creare',
    },
    'a808yte3': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fr': 'Champ requis',
      'it': 'Il campo è obbligatiorio',
    },
    'u4wvxg36': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء تحديد خيار من القائمة المنسدلة',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'it': 'Scegli un\'opzione dal menu a discesa',
    },
  },
  // EditPrdctAddVrt
  {
    '8vhuqouj': {
      'en': 'Edit Product',
      'ar': 'تحرير المنتج',
      'fr': 'Modifier le produit',
      'it': 'Modifica prodotto',
    },
    '97ma5l4x': {
      'en': 'Variant/discount',
      'ar': 'البديل / الخصم',
      'fr': 'Variante/remise',
      'it': 'Variante/sconto',
    },
  },
  // AddProduct
  {
    'uec9vqgi': {
      'en': 'Create Product',
      'ar': 'إنشاء منتج',
      'fr': 'Créer un produit',
      'it': 'Crea prodotto',
    },
    'p4yqasyf': {
      'en': 'Please enter the information below to add a project.',
      'ar': 'الرجاء إدخال المعلومات أدناه لإضافة مشروع.',
      'fr':
          'Veuillez entrer les informations ci-dessous pour ajouter un projet.',
      'it': 'Inserisci le informazioni di seguito per aggiungere un progetto.',
    },
    '8f66sc6b': {
      'en': 'Add Photo',
      'ar': 'إضافة صورة',
      'fr': 'Ajouter une photo',
      'it': 'Aggiungi foto',
    },
    'qh6li9s9': {
      'en': 'Please upload an image!',
      'ar': 'الرجاء تحميل صورة!',
      'fr': 'Veuillez télécharger une image !',
      'it': 'Si prega di caricare un\'immagine!',
    },
    'z7vls7tk': {
      'en': 'Product\'s Name',
      'ar': 'اسم المنتجات',
      'fr': 'Nom du produit',
      'it': 'Nome del prodotto',
    },
    '73ikcbhc': {
      'en': 'Description',
      'ar': 'وصف',
      'fr': 'Description',
      'it': 'Descrizione',
    },
    'lkd9jf3g': {
      'en': 'Product\'s price',
      'ar': 'سعر المنتج',
      'fr': 'Prix ​​du produit',
      'it': 'Prezzo del prodotto',
    },
    '5w659el6': {
      'en': 'Please select a brand..',
      'ar': 'الرجاء تحديد علامة تجارية ..',
      'fr': 'Veuillez sélectionner une marque..',
      'it': 'Seleziona una marca..',
    },
    'a6xhu4ss': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر ...',
      'fr': 'Rechercher un article...',
      'it': 'Cerca un articolo...',
    },
    '9r6opurl': {
      'en': 'Please select a sub category..',
      'ar': 'الرجاء تحديد فئة فرعية ..',
      'fr': 'Veuillez sélectionner une sous-catégorie..',
      'it': 'Seleziona una sottocategoria..',
    },
    'ql6nnx5u': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر ...',
      'fr': 'Rechercher un article...',
      'it': 'Cerca un articolo...',
    },
    'vh3gfkok': {
      'en': 'Please complete the all data selection!',
      'ar': 'من فضلك أكمل اختيار جميع البيانات!',
      'fr': 'Veuillez compléter la sélection de toutes les données !',
      'it': 'Si prega di completare la selezione di tutti i dati!',
    },
    'mt56u7pa': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'fr': 'Annuler',
      'it': 'Annulla',
    },
    'okb6ffij': {
      'en': 'Create',
      'ar': 'يخلق',
      'fr': 'Créer',
      'it': 'Creare',
    },
    'jqa4j4cx': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fr': 'Champ requis',
      'it': 'Il campo è obbligatiorio',
    },
    'boki02z7': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء تحديد خيار من القائمة المنسدلة',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'it': 'Scegli un\'opzione dal menu a discesa',
    },
    '09xr1snq': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fr': 'Champ requis',
      'it': 'Il campo è obbligatiorio',
    },
    '0kssdq59': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء تحديد خيار من القائمة المنسدلة',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'it': 'Scegli un\'opzione dal menu a discesa',
    },
    '5wrajnyy': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fr': 'Champ requis',
      'it': 'Il campo è obbligatiorio',
    },
    'zzotlpfm': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء تحديد خيار من القائمة المنسدلة',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'it': 'Scegli un\'opzione dal menu a discesa',
    },
    'tx7ps4jv': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fr': 'Champ requis',
      'it': 'Il campo è obbligatiorio',
    },
    'btfo823u': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء تحديد خيار من القائمة المنسدلة',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'it': 'Scegli un\'opzione dal menu a discesa',
    },
  },
  // AddBrand
  {
    '8z5xj8qz': {
      'en': 'Create Brand',
      'ar': 'إنشاء علامة تجارية',
      'fr': 'Créer une marque',
      'it': 'Crea marchio',
    },
    'mtlgknaa': {
      'en': 'Please enter the information below to add a brand.',
      'ar': 'الرجاء إدخال المعلومات أدناه لإضافة علامة تجارية.',
      'fr':
          'Veuillez entrer les informations ci-dessous pour ajouter une marque.',
      'it': 'Inserisci le informazioni di seguito per aggiungere un marchio.',
    },
    'ur6ricc1': {
      'en': 'Brand\'s Name',
      'ar': 'اسم العلامة التجارية',
      'fr': 'Nom de la marque',
      'it': 'Nome del marchio',
    },
    'xrxyfs3v': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'fr': 'Annuler',
      'it': 'Annulla',
    },
    'g3vbzrkb': {
      'en': 'Create',
      'ar': 'يخلق',
      'fr': 'Créer',
      'it': 'Creare',
    },
    '0grivzmf': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fr': 'Champ requis',
      'it': 'Il campo è obbligatiorio',
    },
    'cg6dmji9': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء تحديد خيار من القائمة المنسدلة',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'it': 'Scegli un\'opzione dal menu a discesa',
    },
  },
  // webview
  {
    'rqpgzxlk': {
      'en': 'DBH',
      'ar': 'DBH',
      'fr': 'DHP',
      'it': 'DBH',
    },
    'rgtdftno': {
      'en': 'MENU',
      'ar': 'قائمة طعام',
      'fr': 'MENU',
      'it': 'MENÙ',
    },
    'kbeo85zb': {
      'en': 'Home',
      'ar': 'بيت',
      'fr': 'Maison',
      'it': 'Casa',
    },
    'awfan9fm': {
      'en': 'Shop',
      'ar': 'محل',
      'fr': 'Boutique',
      'it': 'Negozio',
    },
    'j9pddajs': {
      'en': 'Cart',
      'ar': 'عربة التسوق',
      'fr': 'Chariot',
      'it': 'Carrello',
    },
    'sb42anzr': {
      'en': 'Favorite',
      'ar': 'مفضل',
      'fr': 'Préféré',
      'it': 'Preferito',
    },
    'tz2nqq4f': {
      'en': 'Profile',
      'ar': 'حساب تعريفي',
      'fr': 'Profil',
      'it': 'Profilo',
    },
    'xnj5368g': {
      'en': 'Settings',
      'ar': 'إعدادات',
      'fr': 'Paramètres',
      'it': 'Impostazioni',
    },
    'wp5wunmy': {
      'en': 'Help Center',
      'ar': 'مركز المساعدة',
      'fr': 'Centre d\'aide',
      'it': 'Centro assistenza',
    },
    '3c9bpohg': {
      'en': 'Having trouble with our application? Contact us below.',
      'ar': 'هل تواجه مشكلة مع تطبيقنا؟ اتصل بنا أدناه.',
      'fr': 'Un problème avec notre application ? Contactez-nous ci-dessous.',
      'it': 'Hai problemi con la nostra applicazione? Contattaci qui sotto.',
    },
    '437z59ip': {
      'en': 'Go To Help Center',
      'ar': 'اذهب إلى مركز المساعدة',
      'fr': 'Aller au centre d\'aide',
      'it': 'Vai al Centro assistenza',
    },
  },
  // EditProduct
  {
    'e5dz6n7a': {
      'en': 'Edit Product',
      'ar': 'تحرير المنتج',
      'fr': 'Modifier le produit',
      'it': 'Modifica prodotto',
    },
    'w1bd01xc': {
      'en': 'Please enter the information below to add a project.',
      'ar': 'الرجاء إدخال المعلومات أدناه لإضافة مشروع.',
      'fr':
          'Veuillez entrer les informations ci-dessous pour ajouter un projet.',
      'it': 'Inserisci le informazioni di seguito per aggiungere un progetto.',
    },
    'a2pfcfjy': {
      'en': 'Add Photo',
      'ar': 'إضافة صورة',
      'fr': 'Ajouter une photo',
      'it': 'Aggiungi foto',
    },
    'o5ma1uvt': {
      'en': 'check this to show it in home page ',
      'ar': 'تحقق من هذا لإظهاره في الصفحة الرئيسية',
      'fr': 'cochez ceci pour l\'afficher dans la page d\'accueil',
      'it': 'controlla questo per mostrarlo nella home page',
    },
    'r6amyhwn': {
      'en': 'click to change sub category',
      'ar': 'انقر لتغيير الفئة الفرعية',
      'fr': 'cliquez pour changer de sous-catégorie',
      'it': 'fare clic per modificare la sottocategoria',
    },
    'c1te785w': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر ...',
      'fr': 'Rechercher un article...',
      'it': 'Cerca un articolo...',
    },
    '7541kp12': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'fr': 'Annuler',
      'it': 'Annulla',
    },
    '04oakri4': {
      'en': 'Update',
      'ar': 'تحديث',
      'fr': 'Mise à jour',
      'it': 'Aggiornamento',
    },
    'oonh7vos': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fr': 'Champ requis',
      'it': 'Il campo è obbligatiorio',
    },
    'z9d2qzma': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء تحديد خيار من القائمة المنسدلة',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'it': 'Scegli un\'opzione dal menu a discesa',
    },
    'fhqb9nbf': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fr': 'Champ requis',
      'it': 'Il campo è obbligatiorio',
    },
    'p7d5uj00': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء تحديد خيار من القائمة المنسدلة',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'it': 'Scegli un\'opzione dal menu a discesa',
    },
    '4p6miekq': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fr': 'Champ requis',
      'it': 'Il campo è obbligatiorio',
    },
    'p2u10qte': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء تحديد خيار من القائمة المنسدلة',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'it': 'Scegli un\'opzione dal menu a discesa',
    },
    '32ptnw2b': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fr': 'Champ requis',
      'it': 'Il campo è obbligatiorio',
    },
    '97vks6jd': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء تحديد خيار من القائمة المنسدلة',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'it': 'Scegli un\'opzione dal menu a discesa',
    },
    'zky9j48p': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fr': 'Champ requis',
      'it': 'Il campo è obbligatiorio',
    },
    'cpslwhh0': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء تحديد خيار من القائمة المنسدلة',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'it': 'Scegli un\'opzione dal menu a discesa',
    },
  },
  // ChooseVariants
  {
    'ehw2criv': {
      'en': 'COLOR:',
      'ar': 'لون:',
      'fr': 'COULEUR:',
      'it': 'COLORE:',
    },
    'n3y89ele': {
      'en': 'SIZE:',
      'ar': 'مقاس:',
      'fr': 'TAILLE:',
      'it': 'MISURARE:',
    },
    '77rmobim': {
      'en': 'Quantity:',
      'ar': 'كمية:',
      'fr': 'Quantité:',
      'it': 'Quantità:',
    },
    '2q6qgkgu': {
      'en': 'Close',
      'ar': 'يغلق',
      'fr': 'Fermer',
      'it': 'Vicino',
    },
    'rqm5n4tf': {
      'en': 'Add to cart',
      'ar': 'أضف إلى السلة',
      'fr': 'Ajouter au panier',
      'it': 'Aggiungi al carrello',
    },
  },
  // deleteColorItem
  {
    '9i3i3b9p': {
      'en': 'Are you sure to delete this item?',
      'ar': 'هل أنت متأكد من حذف هذا العنصر؟',
      'fr': 'Voulez-vous vraiment supprimer cet élément ?',
      'it': 'Sei sicuro di eliminare questo elemento?',
    },
    'fxh22jcy': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'fr': 'Annuler',
      'it': 'Annulla',
    },
    'saoe6rn0': {
      'en': 'Ok',
      'ar': 'نعم',
      'fr': 'D\'accord',
      'it': 'OK',
    },
  },
  // deleteProductItem
  {
    '94wnk12w': {
      'en': 'Are you sure to delete this item?',
      'ar': 'هل أنت متأكد من حذف هذا العنصر؟',
      'fr': 'Voulez-vous vraiment supprimer cet élément ?',
      'it': 'Sei sicuro di eliminare questo elemento?',
    },
    'uayalrq2': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'fr': 'Annuler',
      'it': 'Annulla',
    },
    'q5pogzl5': {
      'en': 'Ok',
      'ar': 'نعم',
      'fr': 'D\'accord',
      'it': 'OK',
    },
  },
  // deleteSizeItem
  {
    'all9vzkc': {
      'en': 'Are you sure to delete this item?',
      'ar': 'هل أنت متأكد من حذف هذا العنصر؟',
      'fr': 'Voulez-vous vraiment supprimer cet élément ?',
      'it': 'Sei sicuro di eliminare questo elemento?',
    },
    'n1ah268c': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'fr': 'Annuler',
      'it': 'Annulla',
    },
    'rts8mxsj': {
      'en': 'Ok',
      'ar': 'نعم',
      'fr': 'D\'accord',
      'it': 'OK',
    },
  },
  // deleteSubCategoryItem
  {
    'ogucgb89': {
      'en': 'Are you sure to delete this sub  category item?',
      'ar': 'هل أنت متأكد من حذف عنصر الفئة الفرعية هذا؟',
      'fr':
          'Êtes-vous sûr de vouloir supprimer cet élément de sous-catégorie ?',
      'it': 'Sei sicuro di eliminare questo elemento della sottocategoria?',
    },
    'qz9s5ds0': {
      'en':
          'Please note that deleting this item sub category will result in the loss of all associated  products. Are you sure you want to proceed with the deletion?',
      'ar':
          'يرجى ملاحظة أن حذف هذه الفئة الفرعية للعنصر سيؤدي إلى فقدان جميع المنتجات المرتبطة. هل أنت متأكد أنك تريد متابعة الحذف؟',
      'fr':
          'Veuillez noter que la suppression de cette sous-catégorie d\'articles entraînera la perte de tous les produits associés. Êtes-vous sûr de vouloir procéder à la suppression ?',
      'it':
          'Tieni presente che l\'eliminazione di questa sottocategoria di articoli comporterà la perdita di tutti i prodotti associati. Sei sicuro di voler procedere con la cancellazione?',
    },
    'oifaxm4m': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'fr': 'Annuler',
      'it': 'Annulla',
    },
    'wzw52ezn': {
      'en': 'Ok',
      'ar': 'نعم',
      'fr': 'D\'accord',
      'it': 'OK',
    },
  },
  // deleteCategoryItem
  {
    '6jkbycqg': {
      'en': 'Are you sure to delete this category item?',
      'ar': 'هل أنت متأكد من حذف عنصر الفئة هذا؟',
      'fr': 'Êtes-vous sûr de vouloir supprimer cet élément de catégorie ?',
      'it': 'Sei sicuro di eliminare questo articolo di categoria?',
    },
    'f4dwblxu': {
      'en':
          'Please note that deleting this item category will result in the loss of all associated subcategories and products. Are you sure you want to proceed with the deletion?',
      'ar':
          'يرجى ملاحظة أن حذف فئة العنصر هذا سيؤدي إلى فقدان جميع الفئات الفرعية والمنتجات المرتبطة. هل أنت متأكد أنك تريد متابعة الحذف؟',
      'fr':
          'Veuillez noter que la suppression de cette catégorie d\'articles entraînera la perte de toutes les sous-catégories et produits associés. Êtes-vous sûr de vouloir procéder à la suppression ?',
      'it':
          'Tieni presente che l\'eliminazione di questa categoria di articoli comporterà la perdita di tutte le sottocategorie e i prodotti associati. Sei sicuro di voler procedere con la cancellazione?',
    },
    '9gv3nnrk': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'fr': 'Annuler',
      'it': 'Annulla',
    },
    'u60tvsn4': {
      'en': 'Ok',
      'ar': 'نعم',
      'fr': 'D\'accord',
      'it': 'OK',
    },
  },
  // deleteVariantItem
  {
    'wm3kdwhi': {
      'en': 'Are you sure to delete this item?',
      'ar': 'هل أنت متأكد من حذف هذا العنصر؟',
      'fr': 'Voulez-vous vraiment supprimer cet élément ?',
      'it': 'Sei sicuro di eliminare questo elemento?',
    },
    'njbl02bu': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'fr': 'Annuler',
      'it': 'Annulla',
    },
    'g2cfl5l0': {
      'en': 'Ok',
      'ar': 'نعم',
      'fr': 'D\'accord',
      'it': 'OK',
    },
  },
  // webviewnew
  {
    'm2wgdo08': {
      'en': 'Women',
      'ar': 'نحيف',
      'fr': 'Femmes',
      'it': 'Donne',
    },
    'ck2r0duz': {
      'en': 'Men',
      'ar': 'رجال',
      'fr': 'Hommes',
      'it': 'Uomini',
    },
  },
  // editcategory
  {
    'mo5dpwcc': {
      'en': 'Please enter the information below to edit a category.',
      'ar': 'الرجاء إدخال المعلومات أدناه لتحرير فئة.',
      'fr':
          'Veuillez saisir les informations ci-dessous pour modifier une catégorie.',
      'it':
          'Inserisci le informazioni di seguito per modificare una categoria.',
    },
    'u1cj30vq': {
      'en': 'Add Photo',
      'ar': 'إضافة صورة',
      'fr': 'Ajouter une photo',
      'it': 'Aggiungi foto',
    },
    '7xuse51d': {
      'en': 'Please upload an image!',
      'ar': 'الرجاء تحميل صورة!',
      'fr': 'Veuillez télécharger une image !',
      'it': 'Si prega di caricare un\'immagine!',
    },
    '6s61u51p': {
      'en': 'Category\'s Name',
      'ar': 'اسم الفئة',
      'fr': 'Nom de la catégorie',
      'it': 'Nome della categoria',
    },
    'liohakaq': {
      'en':
          'Apologies, the category name you\'ve provided already exists in our system. Please try a different name for the subcategory. !',
      'ar':
          'عذرًا ، اسم الفئة الذي قدمته موجود بالفعل في نظامنا. الرجاء محاولة اسم مختلف للفئة الفرعية. !',
      'fr':
          'Toutes nos excuses, le nom de catégorie que vous avez fourni existe déjà dans notre système. Veuillez essayer un nom différent pour la sous-catégorie. !',
      'it':
          'Ci scusiamo, il nome della categoria che hai fornito esiste già nel nostro sistema. Prova un nome diverso per la sottocategoria. !',
    },
    'prbc605c': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'fr': 'Annuler',
      'it': 'Annulla',
    },
    'zw9jjsaw': {
      'en': 'Update',
      'ar': 'تحديث',
      'fr': 'Mise à jour',
      'it': 'Aggiornamento',
    },
    '7wh564xq': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fr': 'Champ requis',
      'it': 'Il campo è obbligatiorio',
    },
    '4qzmwuc4': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء تحديد خيار من القائمة المنسدلة',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'it': 'Scegli un\'opzione dal menu a discesa',
    },
  },
  // editsubcategory
  {
    'p2mfam2v': {
      'en': 'Please enter the information below to edit a category.',
      'ar': 'الرجاء إدخال المعلومات أدناه لتحرير فئة.',
      'fr':
          'Veuillez saisir les informations ci-dessous pour modifier une catégorie.',
      'it':
          'Inserisci le informazioni di seguito per modificare una categoria.',
    },
    'ahm6lntj': {
      'en': 'Add Photo',
      'ar': 'إضافة صورة',
      'fr': 'Ajouter une photo',
      'it': 'Aggiungi foto',
    },
    'ix755pkz': {
      'en': 'Please upload an image!',
      'ar': 'الرجاء تحميل صورة!',
      'fr': 'Veuillez télécharger une image !',
      'it': 'Si prega di caricare un\'immagine!',
    },
    'o3raoirx': {
      'en': 'Category\'s Name',
      'ar': 'اسم الفئة',
      'fr': 'Nom de la catégorie',
      'it': 'Nome della categoria',
    },
    '9oaku1mw': {
      'en':
          'Apologies, the category name you\'ve provided already exists in our system. Please try a different name for the subcategory. !',
      'ar':
          'عذرًا ، اسم الفئة الذي قدمته موجود بالفعل في نظامنا. الرجاء محاولة اسم مختلف للفئة الفرعية. !',
      'fr':
          'Toutes nos excuses, le nom de catégorie que vous avez fourni existe déjà dans notre système. Veuillez essayer un nom différent pour la sous-catégorie. !',
      'it':
          'Ci scusiamo, il nome della categoria che hai fornito esiste già nel nostro sistema. Prova un nome diverso per la sottocategoria. !',
    },
    'aze96eaf': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'fr': 'Annuler',
      'it': 'Annulla',
    },
    'g0inqdg9': {
      'en': 'Modify',
      'ar': 'يُعدِّل',
      'fr': 'Modifier',
      'it': 'Modificare',
    },
    'nrftdh8u': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fr': 'Champ requis',
      'it': 'Il campo è obbligatiorio',
    },
    '5134jl1y': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء تحديد خيار من القائمة المنسدلة',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'it': 'Scegli un\'opzione dal menu a discesa',
    },
  },
  // Discount
  {
    '2jkyat4q': {
      'en': 'Discount / Solde !!!',
      'ar': 'خصم / سولد !!!',
      'fr': 'Remise / Solde !!!',
      'it': 'Sconto / Soldi !!!',
    },
    'mn0rk87r': {
      'en':
          'Please enter the information below to add a discount for all products in the selected subcategorie.',
      'ar':
          'الرجاء إدخال المعلومات أدناه لإضافة خصم لجميع المنتجات في الفئة الفرعية المحددة.',
      'fr':
          'Veuillez saisir les informations ci-dessous pour ajouter une remise sur tous les produits de la sous-catégorie sélectionnée.',
      'it':
          'Inserisci le informazioni di seguito per aggiungere uno sconto per tutti i prodotti nella sottocategoria selezionata.',
    },
    't70vax2p': {
      'en': 'Add Photo',
      'ar': 'إضافة صورة',
      'fr': 'Ajouter une photo',
      'it': 'Aggiungi foto',
    },
    'nelr3jar': {
      'en': 'Please upload an image!',
      'ar': 'الرجاء تحميل صورة!',
      'fr': 'Veuillez télécharger une image !',
      'it': 'Si prega di caricare un\'immagine!',
    },
    '5ifqw4li': {
      'en': ' Name this discount',
      'ar': 'اسم هذا الخصم',
      'fr': 'Nommez cette réduction',
      'it': 'Dai un nome a questo sconto',
    },
    '05jv9i2m': {
      'en': 'Description',
      'ar': 'وصف',
      'fr': 'Description',
      'it': 'Descrizione',
    },
    'vpuotcmd': {
      'en': 'Discount Value',
      'ar': 'قيمة الخصم',
      'fr': 'Valeur de remise',
      'it': 'Valore di sconto',
    },
    'mwk7rv2h': {
      'en': 'Please select a sub category..',
      'ar': 'الرجاء تحديد فئة فرعية ..',
      'fr': 'Veuillez sélectionner une sous-catégorie..',
      'it': 'Seleziona una sottocategoria..',
    },
    'kb6g7dln': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر ...',
      'fr': 'Rechercher un article...',
      'it': 'Cerca un articolo...',
    },
    'e2mc1h5s': {
      'en': 'Please complete the all data selection!',
      'ar': 'من فضلك أكمل اختيار جميع البيانات!',
      'fr': 'Veuillez compléter la sélection de toutes les données !',
      'it': 'Si prega di completare la selezione di tutti i dati!',
    },
    'n934ucc6': {
      'en': 'check this to activate ',
      'ar': 'تحقق من هذا للتفعيل',
      'fr': 'cochez ceci pour activer',
      'it': 'controlla questo per attivare',
    },
    'fqia7ktw': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'fr': 'Annuler',
      'it': 'Annulla',
    },
    'jn9gutmo': {
      'en': 'List of Products',
      'ar': 'قائمة المنتجات',
      'fr': 'Liste des produits',
      'it': 'Elenco dei prodotti',
    },
    'h7mo07r4': {
      'en': 'Create',
      'ar': 'يخلق',
      'fr': 'Créer',
      'it': 'Creare',
    },
    '5w1y4rlz': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fr': 'Champ requis',
      'it': 'Il campo è obbligatiorio',
    },
    '0oinn00p': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء تحديد خيار من القائمة المنسدلة',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'it': 'Scegli un\'opzione dal menu a discesa',
    },
    '3nbot08t': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fr': 'Champ requis',
      'it': 'Il campo è obbligatiorio',
    },
    '8m5codiw': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء تحديد خيار من القائمة المنسدلة',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'it': 'Scegli un\'opzione dal menu a discesa',
    },
    'eni5r9qa': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fr': 'Champ requis',
      'it': 'Il campo è obbligatiorio',
    },
    'mwan0dmn': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء تحديد خيار من القائمة المنسدلة',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'it': 'Scegli un\'opzione dal menu a discesa',
    },
    'ba3yn7gt': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fr': 'Champ requis',
      'it': 'Il campo è obbligatiorio',
    },
    'e2wmzrf0': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء تحديد خيار من القائمة المنسدلة',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'it': 'Scegli un\'opzione dal menu a discesa',
    },
  },
  // listdiscounts
  {
    'd2ueb2qr': {
      'en': 'Please select a sub category..',
      'ar': 'الرجاء تحديد فئة فرعية ..',
      'fr': 'Veuillez sélectionner une sous-catégorie..',
      'it': 'Seleziona una sottocategoria..',
    },
    'zi6rhave': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر ...',
      'fr': 'Rechercher un article...',
      'it': 'Cerca un articolo...',
    },
  },
  // categorymenu
  {
    'st7kwi8v': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر ...',
      'fr': 'Rechercher un article...',
      'it': 'Cerca un articolo...',
    },
  },
  // paymentMethods
  {
    '6uoeeyng': {
      'en': 'Payment Methods',
      'ar': 'طرق الدفع',
      'fr': 'méthodes de payement',
      'it': 'Modalità di pagamento',
    },
    'zedq5nkh': {
      'en': 'Credit card payment',
      'ar': 'الدفع ببطاقة الائتمان',
      'fr': 'Paiement par carte de crédit',
      'it': 'Pagamento con carta di credito',
    },
    '7kn609y0': {
      'en': 'Google play payment',
      'ar': 'جوجل اللعب الدفع',
      'fr': 'Paiement Google play',
      'it': 'Pagamento Google Play',
    },
    'soj2s3cu': {
      'en': 'Paypal payment',
      'ar': 'الدفع باي بال',
      'fr': 'Paiement PayPal',
      'it': 'Pagamento Paypal',
    },
  },
  // emptyProdutcItem
  {
    'wbg0cioo': {
      'en': 'No Items Found',
      'ar': 'لم يتم العثور على العناصر',
      'fr': 'Aucun élément trouvé',
      'it': 'Nessun articolo trovato',
    },
  },
  // listsubcategory
  {
    'gd20hm0d': {
      'en': 'List of sub category',
      'ar': 'قائمة الفئات الفرعية',
      'fr': 'Liste des sous-catégories',
      'it': 'Elenco delle sottocategorie',
    },
  },
  // listcategory
  {
    'vxovnwd3': {
      'en': 'List of category',
      'ar': 'قائمة الفئة',
      'fr': 'Liste de catégorie',
      'it': 'Elenco di categoria',
    },
  },
  // listvariant
  {
    'a41n5brg': {
      'en': 'List of variants',
      'ar': 'قائمة المتغيرات',
      'fr': 'Liste des variantes',
      'it': 'Elenco delle varianti',
    },
    '5y5rj9ye': {
      'en': 'Color :',
      'ar': 'لون :',
      'fr': 'Couleur :',
      'it': 'Colore :',
    },
  },
  // updateRoleUser
  {
    'acps6c6z': {
      'en': 'customer',
      'ar': 'عميل',
      'fr': 'client',
      'it': 'cliente',
    },
    'o9o2uc57': {
      'en': 'customer',
      'ar': 'عميل',
      'fr': 'client',
      'it': 'cliente',
    },
    '8e4ynnsf': {
      'en': 'editor',
      'ar': 'محرر',
      'fr': 'éditeur',
      'it': 'editore',
    },
    'ot0dlmnq': {
      'en': 'admin',
      'ar': 'مسؤل',
      'fr': 'administrateur',
      'it': 'admin',
    },
    '69rk8wpq': {
      'en': 'Please select a role...',
      'ar': 'الرجاء تحديد دور ...',
      'fr': 'Veuillez sélectionner un rôle...',
      'it': 'Seleziona un ruolo...',
    },
    'k2fowh80': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر ...',
      'fr': 'Rechercher un article...',
      'it': 'Cerca un articolo...',
    },
    'uj369073': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'fr': 'Annuler',
      'it': 'Annulla',
    },
    '1xrk8ay5': {
      'en': 'Ok',
      'ar': 'نعم',
      'fr': 'D\'accord',
      'it': 'OK',
    },
  },
  // addPromotion
  {
    'an93tjw4': {
      'en': 'Create Promotion',
      'ar': 'خلق الترويج',
      'fr': 'Créer une promotion',
      'it': 'Crea promozione',
    },
    'y0ru6ksj': {
      'en': 'Please enter the information below to add a promotion.',
      'ar': 'الرجاء إدخال المعلومات أدناه لإضافة ترقية.',
      'fr':
          'Veuillez entrer les informations ci-dessous pour ajouter une promotion.',
      'it':
          'Inserisci le informazioni di seguito per aggiungere una promozione.',
    },
    'rllwnvhe': {
      'en': 'Promotion\'s Name',
      'ar': 'اسم الترويج',
      'fr': 'Nom de la promotion',
      'it': 'Nome della promozione',
    },
    'uxq9rwy2': {
      'en': '',
      'ar': '',
      'fr': '',
      'it': '',
    },
    'fougbelf': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'fr': 'Annuler',
      'it': 'Annulla',
    },
    'v3ff1pnb': {
      'en': 'Create',
      'ar': 'يخلق',
      'fr': 'Créer',
      'it': 'Creare',
    },
    'oljjpdrh': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fr': 'Champ requis',
      'it': 'Il campo è obbligatiorio',
    },
    'cwechv8v': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء تحديد خيار من القائمة المنسدلة',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'it': 'Scegli un\'opzione dal menu a discesa',
    },
  },
  // AddHomePImage
  {
    'oyszc60w': {
      'en': 'Create Home Image',
      'ar': 'إنشاء صورة المنزل',
      'fr': 'Créer une image d\'accueil',
      'it': 'Crea immagine domestica',
    },
    'qvo053ts': {
      'en': 'Please enter the information below to add a home image.',
      'ar': 'الرجاء إدخال المعلومات أدناه لإضافة صورة المنزل.',
      'fr':
          'Veuillez saisir les informations ci-dessous pour ajouter une image d\'accueil.',
      'it':
          'Inserisci le informazioni di seguito per aggiungere un\'immagine della casa.',
    },
    'qrtrgw6e': {
      'en': 'Add Photo',
      'ar': 'إضافة صورة',
      'fr': 'Ajouter une photo',
      'it': 'Aggiungi foto',
    },
    'vuasd2jq': {
      'en': 'Please upload an image!',
      'ar': 'الرجاء تحميل صورة!',
      'fr': 'Veuillez télécharger une image !',
      'it': 'Si prega di caricare un\'immagine!',
    },
    'almr9lz7': {
      'en': 'Button text',
      'ar': 'زر كتابة',
      'fr': 'Texte du bouton',
      'it': 'Testo del pulsante',
    },
    'jefgvoh0': {
      'en': '1',
      'ar': '1',
      'fr': '1',
      'it': '1',
    },
    'v0odsz72': {
      'en': '2',
      'ar': '2',
      'fr': '2',
      'it': '2',
    },
    'oe64ujk8': {
      'en': '3',
      'ar': '3',
      'fr': '3',
      'it': '3',
    },
    'fz5a36u4': {
      'en': '4',
      'ar': '4',
      'fr': '4',
      'it': '4',
    },
    'hpifa2py': {
      'en': '5',
      'ar': '5',
      'fr': '5',
      'it': '5',
    },
    '6shg1la1': {
      'en': '6',
      'ar': '6',
      'fr': '6',
      'it': '6',
    },
    'ktci1izj': {
      'en': 'Please select a picture position',
      'ar': 'الرجاء تحديد موضع الصورة',
      'fr': 'Veuillez sélectionner une position d\'image',
      'it': 'Si prega di selezionare una posizione dell\'immagine',
    },
    'wjjas7sj': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر ...',
      'fr': 'Rechercher un article...',
      'it': 'Cerca un articolo...',
    },
    'hagoszxl': {
      'en': 'Please select a sub category..',
      'ar': 'الرجاء تحديد فئة فرعية ..',
      'fr': 'Veuillez sélectionner une sous-catégorie..',
      'it': 'Seleziona una sottocategoria..',
    },
    'wvmw3u84': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر ...',
      'fr': 'Rechercher un article...',
      'it': 'Cerca un articolo...',
    },
    'xj5rtoim': {
      'en': 'Please complete the all data selection!',
      'ar': 'من فضلك أكمل اختيار جميع البيانات!',
      'fr': 'Veuillez compléter la sélection de toutes les données !',
      'it': 'Si prega di completare la selezione di tutti i dati!',
    },
    'qla8ns4l': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'fr': 'Annuler',
      'it': 'Annulla',
    },
    'rfvvcxno': {
      'en': 'Create',
      'ar': 'يخلق',
      'fr': 'Créer',
      'it': 'Creare',
    },
    'bp93xprz': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fr': 'Champ requis',
      'it': 'Il campo è obbligatiorio',
    },
    'gk1ranpj': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء تحديد خيار من القائمة المنسدلة',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'it': 'Scegli un\'opzione dal menu a discesa',
    },
    'qlzfag83': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fr': 'Champ requis',
      'it': 'Il campo è obbligatiorio',
    },
    '6hvjnh2p': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء تحديد خيار من القائمة المنسدلة',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'it': 'Scegli un\'opzione dal menu a discesa',
    },
    'nn4m0djb': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fr': 'Champ requis',
      'it': 'Il campo è obbligatiorio',
    },
    'xaxnh059': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء تحديد خيار من القائمة المنسدلة',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'it': 'Scegli un\'opzione dal menu a discesa',
    },
    'qdhw7aco': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fr': 'Champ requis',
      'it': 'Il campo è obbligatiorio',
    },
    'uxekzrpq': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء تحديد خيار من القائمة المنسدلة',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'it': 'Scegli un\'opzione dal menu a discesa',
    },
  },
  // EditHomePImage
  {
    'jfqd8u09': {
      'en': 'Edit Home Image',
      'ar': 'تحرير الصورة الرئيسية',
      'fr': 'Modifier une image d\'accueil',
      'it': 'Modifica l\'immagine domestica',
    },
    'jfqd8u01': {
      'en': 'Edit Home Image Position',
      'ar': 'تحرير موضع الصورة الرئيسية',
      'fr': 'Modifier la position de l\'image d\'accueil',
      'it': 'Modifica la posizione dell\'immagine domestica',
    },
    '66rqedi1': {
      'en': 'Please enter the information below to add a home image.',
      'ar': 'الرجاء إدخال المعلومات أدناه لإضافة صورة المنزل.',
      'fr':
          'Veuillez saisir les informations ci-dessous pour ajouter une image d\'accueil.',
      'it':
          'Inserisci le informazioni di seguito per aggiungere un\'immagine della casa.',
    },
    't601p98e': {
      'en': 'Add Photo',
      'ar': 'إضافة صورة',
      'fr': 'Ajouter une photo',
      'it': 'Aggiungi foto',
    },
    'kqsoh4p0': {
      'en': 'Please upload an image!',
      'ar': 'الرجاء تحميل صورة!',
      'fr': 'Veuillez télécharger une image !',
      'it': 'Si prega di caricare un\'immagine!',
    },
    'ijk1eda2': {
      'en': 'Button text',
      'ar': 'زر كتابة',
      'fr': 'Texte du bouton',
      'it': 'Testo del pulsante',
    },
    'tzd2nvok': {
      'en': '1',
      'ar': '1',
      'fr': '1',
      'it': '1',
    },
    '8jduegnr': {
      'en': '2',
      'ar': '2',
      'fr': '2',
      'it': '2',
    },
    'z8cmapgi': {
      'en': '3',
      'ar': '3',
      'fr': '3',
      'it': '3',
    },
    'lz7frkch': {
      'en': '4',
      'ar': '4',
      'fr': '4',
      'it': '4',
    },
    'psk646v6': {
      'en': '5',
      'ar': '5',
      'fr': '5',
      'it': '5',
    },
    'gxv49pzw': {
      'en': '6',
      'ar': '6',
      'fr': '6',
      'it': '6',
    },
    '82jlk07d': {
      'en': 'Please select an order..',
      'ar': 'الرجاء تحديد طلب ..',
      'fr': 'Veuillez sélectionner une commande..',
      'it': 'Si prega di selezionare un ordine..',
    },
    'ie2mpm0o': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر ...',
      'fr': 'Rechercher un article...',
      'it': 'Cerca un articolo...',
    },
    'qcb52cb6': {
      'en': 'Please select a sub category..',
      'ar': 'الرجاء تحديد فئة فرعية ..',
      'fr': 'Veuillez sélectionner une sous-catégorie..',
      'it': 'Seleziona una sottocategoria..',
    },
    'si6cgnz2': {
      'en': 'Search for an item...',
      'ar': 'البحث عن عنصر ...',
      'fr': 'Rechercher un article...',
      'it': 'Cerca un articolo...',
    },
    'la6dl2c2': {
      'en': 'Please complete the all data selection!',
      'ar': 'من فضلك أكمل اختيار جميع البيانات!',
      'fr': 'Veuillez compléter la sélection de toutes les données !',
      'it': 'Si prega di completare la selezione di tutti i dati!',
    },
    'dhj2ag2v': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'fr': 'Annuler',
      'it': 'Annulla',
    },
    'klh09rf1': {
      'en': 'Update',
      'ar': 'تحديث',
      'fr': 'Mise à jour',
      'it': 'Aggiornamento',
    },
    'fbiwr4dn': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fr': 'Champ requis',
      'it': 'Il campo è obbligatiorio',
    },
    's6kn4d9e': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء تحديد خيار من القائمة المنسدلة',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'it': 'Scegli un\'opzione dal menu a discesa',
    },
    'e60invw7': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fr': 'Champ requis',
      'it': 'Il campo è obbligatiorio',
    },
    'asyy2zut': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء تحديد خيار من القائمة المنسدلة',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'it': 'Scegli un\'opzione dal menu a discesa',
    },
    'o023hvvb': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fr': 'Champ requis',
      'it': 'Il campo è obbligatiorio',
    },
    'bxexpwc8': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء تحديد خيار من القائمة المنسدلة',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'it': 'Scegli un\'opzione dal menu a discesa',
    },
    'lkxnt7b3': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fr': 'Champ requis',
      'it': 'Il campo è obbligatiorio',
    },
    'o84eqbzd': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء تحديد خيار من القائمة المنسدلة',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'it': 'Scegli un\'opzione dal menu a discesa',
    },
  },
  // EditPromotion
  {
    'r4hefmzz': {
      'en': 'Edit Promotion',
      'ar': 'خلق الترويج',
      'fr': 'Créer une promotion',
      'it': 'Crea promozione',
    },
    'gtjl4ant': {
      'en': 'Please enter the information below to add a promotion.',
      'ar': 'الرجاء إدخال المعلومات أدناه لإضافة ترقية.',
      'fr':
          'Veuillez entrer les informations ci-dessous pour ajouter une promotion.',
      'it':
          'Inserisci le informazioni di seguito per aggiungere una promozione.',
    },
    '00zvifik': {
      'en': 'Promotion\'s Name',
      'ar': 'اسم الترويج',
      'fr': 'Nom de la promotion',
      'it': 'Nome della promozione',
    },
    '02zoh1e0': {
      'en': 'Cancel',
      'ar': 'يلغي',
      'fr': 'Annuler',
      'it': 'Annulla',
    },
    'rx8r43kk': {
      'en': 'Update',
      'ar': 'يخلق',
      'fr': 'Créer',
      'it': 'Creare',
    },
    'nwjqwadx': {
      'en': 'Field is required',
      'ar': 'الحقل مطلوب',
      'fr': 'Champ requis',
      'it': 'Il campo è obbligatiorio',
    },
    '7m3rgmgc': {
      'en': 'Please choose an option from the dropdown',
      'ar': 'الرجاء تحديد خيار من القائمة المنسدلة',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
      'it': 'Scegli un\'opzione dal menu a discesa',
    },
  },
  // footerWebview
  {
    'km5yksq4': {
      'en': 'FREE DELIVERY',
      'ar': 'توصيل مجاني',
      'fr': 'LIVRAISON GRATUITE',
      'it': 'CONSEGNA GRATUITA',
    },
    '8n2p1puo': {
      'en': 'AVAILABLE IN STORE AND FROM €60 AT HOME',
      'ar': 'متوفر في المتجر ومن 60 يورو في المنزل',
      'fr': 'DISPONIBLE EN MAGASIN ET A PARTIR DE 60€ A DOMICILE',
      'it': 'DISPONIBILE IN NEGOZIO E DA € 60 A DOMICILIO',
    },
    'za017rlp': {
      'en': 'FREE RETURNS',
      'ar': 'عوائد مجانية',
      'fr': 'RETOURS SANS FRAIS',
      'it': 'RESI GRATUITI',
    },
    'r4nooc65': {
      'en': 'WITHIN 30 DAYS, WITHOUT MINIMUM PURCHASE',
      'ar': 'خلال 30 يومًا ، بدون حد أدنى للشراء',
      'fr': 'SOUS 30 JOURS, SANS MINIMUM D\'ACHAT',
      'it': 'ENTRO 30 GIORNI, SENZA MINIMO DI ACQUISTO',
    },
    'l1mqriiz': {
      'en': 'CUSTOMER SERVICE',
      'ar': 'خدمة الزبائن',
      'fr': 'SERVICE CLIENTS',
      'it': 'ASSISTENZA CLIENTI',
    },
    '23uvi0ij': {
      'en': 'AT YOUR SERVICE FROM MONDAY TO FRIDAY',
      'ar': 'في خدمتك من الاثنين إلى الجمعة',
      'fr': 'A VOTRE SERVICE DU LUNDI AU VENDREDI',
      'it': 'AL TUO SERVIZIO DAL LUNEDI\' AL VENERDI\'',
    },
    '1tbq31yx': {
      'en': 'DBH MODE',
      'ar': 'DBH MODE',
      'fr': 'DBH MODE',
      'it': 'DBH MODE',
    },
    'wnhueau2': {
      'en': 'About Us',
      'ar': 'معلومات عنا',
      'fr': 'À propos de nous',
      'it': 'Chi siamo',
    },
    'qduhw0mh': {
      'en': 'ONLNE SELLING',
      'ar': 'البيع عبر الإنترنت',
      'fr': 'VENTE EN LIGNE',
      'it': 'VENDITA ONLINE',
    },
    '41xo8uun': {
      'en': 'CGV',
      'ar': 'CGV',
      'fr': 'CGV',
      'it': 'CGV',
    },
    '5ecs8gwk': {
      'en': 'Customer account',
      'ar': 'حساب العميل',
      'fr': 'Compte client',
      'it': 'Conto cliente',
    },
    'bv5bk8x7': {
      'en': 'Delivery and return',
      'ar': 'التسليم والعودة',
      'fr': 'Livraison et retour',
      'it': 'Consegna e restituzione',
    },
    '8x3eguub': {
      'en': 'Secure payment',
      'ar': 'دفع امن',
      'fr': 'paiement sécurisé',
      'it': 'pagamento sicuro',
    },
    'rw4iuy7y': {
      'en': 'CUSTOMER SERVICE',
      'ar': 'خدمة الزبائن',
      'fr': 'SERVICE CLIENTS',
      'it': 'ASSISTENZA CLIENTI',
    },
    '38tvnzhv': {
      'en': 'Contact',
      'ar': 'اتصال',
      'fr': 'Contact',
      'it': 'Contatto',
    },
    'jwpgfkq7': {
      'en': 'CUSTOMER SERVICE',
      'ar': 'خدمة الزبائن',
      'fr': 'SERVICE CLIENTS',
      'it': 'ASSISTENZA CLIENTI',
    },
    '3n7mian4': {
      'en': 'Facebook',
      'ar': 'فيسبوك',
      'fr': 'Facebook',
      'it': 'Facebook',
    },
    'hcrmxwc9': {
      'en': 'Instagram',
      'ar': 'انستغرام',
      'fr': 'Instagram',
      'it': 'Instagram',
    },
    'k2i3ia65': {
      'en': 'Pinterest',
      'ar': 'بينتيريست',
      'fr': 'Pinterest',
      'it': 'Pinterest',
    },
  },
  // Miscellaneous
  {
    'ngqu2gxf': {
      'en':
          'In order to take a picture or video, this app requires permission to access the camera.',
      'ar':
          'من أجل التقاط صورة أو مقطع فيديو ، يتطلب هذا التطبيق إذنًا للوصول إلى الكاميرا.',
      'fr':
          'Pour prendre une photo ou une vidéo, cette application nécessite l\'autorisation d\'accéder à l\'appareil photo.',
      'it':
          'Per scattare una foto o un video, questa app richiede l\'autorizzazione per accedere alla fotocamera.',
    },
    'qactv801': {
      'en':
          'In order to upload data, this app requires permission to access the photo library.',
      'ar': 'لتحميل البيانات ، يتطلب هذا التطبيق إذنًا للوصول إلى مكتبة الصور.',
      'fr':
          'Afin de télécharger des données, cette application nécessite l\'autorisation d\'accéder à la photothèque.',
      'it':
          'Per caricare i dati, questa app richiede l\'autorizzazione per accedere alla libreria di foto.',
    },
    'yuuy335e': {
      'en': '',
      'ar': '',
      'fr': '',
      'it': '',
    },
    '0nmbpogx': {
      'en': '',
      'ar': '',
      'fr': '',
      'it': '',
    },
    'rxluygie': {
      'en': '',
      'ar': '',
      'fr': '',
      'it': '',
    },
    'vmoxfq3p': {
      'en': '',
      'ar': '',
      'fr': '',
      'it': '',
    },
    '16rfn99j': {
      'en': '',
      'ar': '',
      'fr': '',
      'it': '',
    },
    'owye4lsk': {
      'en': '',
      'ar': '',
      'fr': '',
      'it': '',
    },
    'lf78f00r': {
      'en': '',
      'ar': '',
      'fr': '',
      'it': '',
    },
    'qt6p5jdi': {
      'en': '',
      'ar': '',
      'fr': '',
      'it': '',
    },
    'odal14as': {
      'en': '',
      'ar': '',
      'fr': '',
      'it': '',
    },
    '3cflv0ib': {
      'en': '',
      'ar': '',
      'fr': '',
      'it': '',
    },
    '2is6r01t': {
      'en': '',
      'ar': '',
      'fr': '',
      'it': '',
    },
    'h7gd6aps': {
      'en': '',
      'ar': '',
      'fr': '',
      'it': '',
    },
    'dk4bzzhh': {
      'en': '',
      'ar': '',
      'fr': '',
      'it': '',
    },
    '16a7iel6': {
      'en': '',
      'ar': '',
      'fr': '',
      'it': '',
    },
    'bu4nih1m': {
      'en': '',
      'ar': '',
      'fr': '',
      'it': '',
    },
    'hpsp6tap': {
      'en': '',
      'ar': '',
      'fr': '',
      'it': '',
    },
    '4bk4q304': {
      'en': '',
      'ar': '',
      'fr': '',
      'it': '',
    },
    'xancv9vf': {
      'en': '',
      'ar': '',
      'fr': '',
      'it': '',
    },
    '9anylczy': {
      'en': '',
      'ar': '',
      'fr': '',
      'it': '',
    },
    'rvq379tb': {
      'en': '',
      'ar': '',
      'fr': '',
      'it': '',
    },
    '1rfuu04e': {
      'en': '',
      'ar': '',
      'fr': '',
      'it': '',
    },
    'bijhm2qn': {
      'en': '',
      'ar': '',
      'fr': '',
      'it': '',
    },
    'diejn6jh': {
      'en': '',
      'ar': '',
      'fr': '',
      'it': '',
    },
  },
].reduce((a, b) => a..addAll(b));
