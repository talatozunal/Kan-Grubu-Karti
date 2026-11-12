/* =========================================================
   Kan Grubu Kartı — site betiği
   - İki dilli arayüz (Türkçe, İngilizce)
   - Mobil menü, dil menüsü, kaydırma efektleri, SSS akordeonu
   ========================================================= */

(function () {
  "use strict";

  var I18N = {
    tr: {
      "meta.title": "Kan Grubu Kartı — Kan grubunuz cebinizde",
      "meta.description": "Kan grubunuzu ve temel bilgilerinizi paylaşılabilir, yüksek çözünürlüklü bir karta dönüştürün. Hesap yok, sunucu yok, reklam yok.",
      "a11y.skip": "İçeriğe geç",
      "nav.features": "Özellikler",
      "nav.screens": "Ekranlar",
      "nav.privacy": "Gizlilik",
      "nav.faq": "S.S.S.",
      "nav.cta": "GitHub",
      "hero.badge": "Tek ekran · Tamamen cihazda",
      "hero.title": "Kan grubunuz,",
      "hero.titleAccent": "cebinizde.",
      "hero.lead": "Sağlık merkezi, ad soyad, doğum yeri ve kan grubunuzu girin; uygulama paylaşılabilir, yüksek çözünürlüklü bir kart oluştursun. Hesap yok, sunucu yok, reklam yok.",
      "hero.cta1": "Kaynak kodu gör",
      "hero.cta2": "Özellikleri gör",
      "hero.chip1": "Reklamsız",
      "hero.chip2": "Çevrimdışı çalışır",
      "hero.chip3": "Veriler cihazda",
      "hero.note": "iOS 16+ · iPhone ve iPad · Beş dilde",
      "float.group": "8 kan grubu",
      "float.groupSub": "A · B · AB · O",
      "float.badge": "Kan grubu rozeti",
      "float.badgeSub": "Uluslararası gösterim",
      "float.lang": "5 dil",
      "stats.1": "form alanı",
      "stats.2": "kan grubu",
      "stats.3": "çıktı çözünürlüğü",
      "stats.4": "dil",
      "stats.5": "sunucu",
      "features.eyebrow": "Özellikler",
      "features.title": "Kan grubu kartı için ihtiyacınız olan her şey",
      "features.lead": "Tek ekran, altı alan ve paylaşılabilir yüksek çözünürlüklü bir çıktı.",
      "f1.title": "Altı Alanlı Form",
      "f1.text": "Sağlık merkezi, ad soyad, doğum yeri, doğum tarihi, kan grubu ve onaylayan hekim.",
      "f2.title": "Sekiz Kan Grubu",
      "f2.text": "A, B, AB ve O'nun Rh+ ve Rh− seçenekleri. Kartta AB Rh+ gibi uluslararası gösterim kullanılır.",
      "f3.title": "Canlı Kart Önizlemesi",
      "f3.text": "Kart, yazdırma ve yakınlaştırma için 3× (1200 × 750 px) oluşturulur ve ekranda ölçeklenir.",
      "f4.title": "Paylaş veya Kaydet",
      "f4.text": "Sistem paylaşım sayfası Mesajlar, Mail, AirDrop ve yazdırmayı kapsar; “Görseli Kaydet” Fotoğraflar'a ekler.",
      "f5.title": "Okunaklı Kart Tasarımı",
      "f5.text": "Beyaz zemin, kırmızı çerçeve, etiketli satırlar ve tek bakışta görünen kan grubu rozeti.",
      "f6.title": "Beş Dil",
      "f6.text": "Türkçe, İngilizce, Almanca, Fransızca, İtalyanca. Bilgi panelinden yeniden başlatmadan değişir.",
      "screens.eyebrow": "Ekranlar",
      "screens.title": "Uygulamanın içinden",
      "screens.lead": "Boş formdan paylaşıma hazır karta kadar dört adım.",
      "s1": "Boş form",
      "s2": "Doldurulmuş form",
      "s3": "Kart önizlemesi",
      "s4": "Bilgi paneli",
      "how.eyebrow": "Nasıl çalışır",
      "how.title": "Üç adımda hazır",
      "how.1t": "Formu doldurun",
      "how.1d": "Sağlık merkezi zorunludur; diğer alanları dilediğiniz kadar doldurabilirsiniz.",
      "how.2t": "Kartı önizleyin",
      "how.2d": "“Kartı Göster” ile kart ekranın ortasında, okunaklı haliyle görünür.",
      "how.3t": "Paylaşın veya kaydedin",
      "how.3d": "Görseli Fotoğraflar'a kaydedin ya da Mesajlar, Mail veya AirDrop ile gönderin.",
      "privacy.eyebrow": "Gizlilik",
      "privacy.title": "Hiçbir veri cihazınızdan çıkmaz.",
      "privacy.lead": "Form yalnızca bellekte tutulur; uygulama hiçbir kişisel veriyi saklamaz ve hiçbir ağ isteği yapmaz.",
      "privacy.1": "Kart görseli cihazda oluşturulur; yalnızca paylaşım sayfasında hedef seçtiğinizde uygulamadan ayrılır.",
      "privacy.2": "Analitik, reklam SDK'sı veya takip kodu yok.",
      "privacy.3": "Kaydedilen görseller iOS Fotoğraflar ve paylaştığınız uygulamalar tarafından yönetilir.",
      "privacy.link": "Kaynak kodunu inceleyin",
      "privacy.badge": "Ağ isteği yok",
      "faq.eyebrow": "S.S.S.",
      "faq.title": "Sık sorulan sorular",
      "faq.1q": "Uygulama ücretli mi?",
      "faq.1a": "Hayır. Uygulama herhangi bir ücret talep etmiyor ve kaynak kodu GitHub'da açık.",
      "faq.2q": "Kart resmî bir belge mi?",
      "faq.2a": "Hayır. Kart kişisel bir özettir; resmî tıbbi veya kimlik belgesi değildir. Acil durumlarda sağlık profesyonellerine başvurun.",
      "faq.3q": "Verilerim nerede saklanıyor?",
      "faq.3a": "Hiçbir yerde. Form yalnızca bellekte tutulur; uygulama kapandığında girilen bilgiler saklanmaz.",
      "faq.4q": "Kartı nasıl paylaşıyorum?",
      "faq.4a": "Kart ekranındaki paylaş düğmesi sistem paylaşım sayfasını açar. “Görseli Kaydet” ile Fotoğraflar'a ekleyebilirsiniz.",
      "faq.5q": "Dili nasıl değiştiririm?",
      "faq.5a": "Alttaki bilgi barına dokunun, Dil bölümünden bir dil seçin. Form ve kart yeniden başlatmadan güncellenir.",
      "faq.6q": "Android sürümü var mı?",
      "faq.6a": "Şimdilik iOS 16+ için iPhone ve iPad sürümü var. Proje geliştirme aşamasında.",
      "dl.title": "Kaynak kodu GitHub'da",
      "dl.lead": "Xcode 16 ile derleyip iPhone veya iPad'inizde çalıştırabilirsiniz.",
      "dl.github": "GitHub'da görüntüle",
      "dl.docs": "Kullanım kılavuzu",
      "dl.note": "Uygulama geliştirme aşamasındadır; App Store sürümü henüz yayınlanmadı.",
      "footer.tagline": "Kan grubunuz tek bakışta, paylaşıma hazır.",
      "footer.by": "Talat Özünal"
    },
    en: {
      "meta.title": "Blood Group Card — Your blood group in your pocket",
      "meta.description": "Turn your blood group and basic details into a shareable, high-resolution card. No account, no server, no ads.",
      "a11y.skip": "Skip to content",
      "nav.features": "Features",
      "nav.screens": "Screens",
      "nav.privacy": "Privacy",
      "nav.faq": "FAQ",
      "nav.cta": "GitHub",
      "hero.badge": "Single screen · Fully on device",
      "hero.title": "Your blood group,",
      "hero.titleAccent": "in your pocket.",
      "hero.lead": "Enter your health centre, full name, place of birth and blood group; the app creates a shareable, high-resolution card. No account, no server, no ads.",
      "hero.cta1": "View source code",
      "hero.cta2": "See features",
      "hero.chip1": "No ads",
      "hero.chip2": "Works offline",
      "hero.chip3": "Data stays on device",
      "hero.note": "iOS 16+ · iPhone and iPad · Five languages",
      "float.group": "8 blood groups",
      "float.groupSub": "A · B · AB · O",
      "float.badge": "Blood group badge",
      "float.badgeSub": "International notation",
      "float.lang": "5 languages",
      "stats.1": "form fields",
      "stats.2": "blood groups",
      "stats.3": "output resolution",
      "stats.4": "languages",
      "stats.5": "servers",
      "features.eyebrow": "Features",
      "features.title": "Everything you need for a blood group card",
      "features.lead": "One screen, six fields and a shareable high-resolution output.",
      "f1.title": "Six-Field Form",
      "f1.text": "Health centre, full name, place of birth, date of birth, blood group and approving physician.",
      "f2.title": "Eight Blood Groups",
      "f2.text": "Rh+ and Rh− options for A, B, AB and O. The card uses international notation such as AB Rh+.",
      "f3.title": "Live Card Preview",
      "f3.text": "The card is rendered at 3× (1200 × 750 px) for printing and zooming, then scaled on screen.",
      "f4.title": "Share or Save",
      "f4.text": "The system share sheet covers Messages, Mail, AirDrop and printing; “Save Image” adds it to Photos.",
      "f5.title": "Legible Card Design",
      "f5.text": "White background, red frame, labelled rows and a blood group badge visible at a glance.",
      "f6.title": "Five Languages",
      "f6.text": "Turkish, English, German, French, Italian. Switch from the info panel without restarting.",
      "screens.eyebrow": "Screens",
      "screens.title": "From inside the app",
      "screens.lead": "Four steps from an empty form to a card ready to share.",
      "s1": "Empty form",
      "s2": "Filled form",
      "s3": "Card preview",
      "s4": "Info panel",
      "how.eyebrow": "How it works",
      "how.title": "Ready in three steps",
      "how.1t": "Fill in the form",
      "how.1d": "The health centre is required; fill in the other fields as much as you like.",
      "how.2t": "Preview the card",
      "how.2d": "“Show Card” displays the card in the centre of the screen at a legible size.",
      "how.3t": "Share or save",
      "how.3d": "Save the image to Photos or send it via Messages, Mail or AirDrop.",
      "privacy.eyebrow": "Privacy",
      "privacy.title": "No data ever leaves your device.",
      "privacy.lead": "The form lives only in memory; the app stores no personal data and makes no network requests.",
      "privacy.1": "The card image is created on device; it only leaves the app when you pick a target in the share sheet.",
      "privacy.2": "No analytics, no ad SDK, no tracking code.",
      "privacy.3": "Saved images are managed by iOS Photos and the apps you share them with.",
      "privacy.link": "Explore the source code",
      "privacy.badge": "No network requests",
      "faq.eyebrow": "FAQ",
      "faq.title": "Frequently asked questions",
      "faq.1q": "Is the app paid?",
      "faq.1a": "No. The app is free of charge and its source code is open on GitHub.",
      "faq.2q": "Is the card an official document?",
      "faq.2a": "No. The card is a personal summary; it is not an official medical or identity document. In emergencies, consult healthcare professionals.",
      "faq.3q": "Where is my data stored?",
      "faq.3a": "Nowhere. The form lives only in memory; entered details are not stored when the app closes.",
      "faq.4q": "How do I share the card?",
      "faq.4a": "The share button on the card screen opens the system share sheet. Use “Save Image” to add it to Photos.",
      "faq.5q": "How do I change the language?",
      "faq.5a": "Tap the info bar at the bottom and pick a language under Language. The form and card update without restarting.",
      "faq.6q": "Is there an Android version?",
      "faq.6a": "For now there is an iPhone and iPad version for iOS 16+. The project is in development.",
      "dl.title": "Source code on GitHub",
      "dl.lead": "Build it with Xcode 16 and run it on your iPhone or iPad.",
      "dl.github": "View on GitHub",
      "dl.docs": "User guide",
      "dl.note": "The app is in development; the App Store version has not been released yet.",
      "footer.tagline": "Your blood group at a glance, ready to share.",
      "footer.by": "Talat Özünal"
    }
  };

  var STORAGE_KEY = "kanGrubuKarti.lang";
  var DEFAULT_LANG = "tr";
  var SUPPORTED = ["tr", "en"];
  var CODES = { tr: "TR", en: "EN" };

  var root = document.documentElement;
  var langBox = document.getElementById("lang");
  var langButton = document.getElementById("langButton");
  var langMenu = document.getElementById("langMenu");
  var langCode = document.getElementById("langCode");
  var burger = document.getElementById("burger");
  var nav = document.getElementById("nav");
  var header = document.getElementById("header");

  function normalize(code) {
    if (!code) return null;
    var base = String(code).toLowerCase().split("-")[0];
    return SUPPORTED.indexOf(base) >= 0 ? base : null;
  }

  function storedLang() {
    try { return normalize(localStorage.getItem(STORAGE_KEY)); } catch (e) { return null; }
  }

  function browserLang() {
    var list = navigator.languages || [navigator.language || ""];
    for (var i = 0; i < list.length; i++) {
      var found = normalize(list[i]);
      if (found) return found;
    }
    return null;
  }

  function translate(code) {
    var dict = I18N[code] || I18N[DEFAULT_LANG];
    var nodes = document.querySelectorAll("[data-i18n]");
    for (var i = 0; i < nodes.length; i++) {
      var key = nodes[i].getAttribute("data-i18n");
      if (Object.prototype.hasOwnProperty.call(dict, key)) {
        nodes[i].textContent = dict[key];
      }
    }
    document.title = dict["meta.title"] || document.title;
    var desc = document.querySelector('meta[name="description"]');
    if (desc && dict["meta.description"]) desc.setAttribute("content", dict["meta.description"]);
    root.setAttribute("lang", code);
    if (langCode) langCode.textContent = CODES[code] || code.toUpperCase();

    var items = document.querySelectorAll(".lang__item");
    for (var j = 0; j < items.length; j++) {
      var active = items[j].getAttribute("data-lang") === code;
      items[j].classList.toggle("is-active", active);
      items[j].setAttribute("aria-current", active ? "true" : "false");
    }
  }

  function setLang(code, remember) {
    var safe = SUPPORTED.indexOf(code) >= 0 ? code : DEFAULT_LANG;
    translate(safe);
    if (remember) {
      try { localStorage.setItem(STORAGE_KEY, safe); } catch (e) { /* yoksay */ }
    }
  }

  /* --- dil menüsü --- */
  function openLang(open) {
    if (!langBox || !langButton) return;
    langBox.classList.toggle("is-open", open);
    langButton.setAttribute("aria-expanded", open ? "true" : "false");
  }

  if (langButton) {
    langButton.addEventListener("click", function (event) {
      event.stopPropagation();
      openLang(!langBox.classList.contains("is-open"));
    });
  }

  if (langMenu) {
    langMenu.addEventListener("click", function (event) {
      var button = event.target.closest(".lang__item");
      if (!button) return;
      setLang(button.getAttribute("data-lang"), true);
      openLang(false);
      if (langButton) langButton.focus();
    });
  }

  document.addEventListener("click", function (event) {
    if (langBox && !langBox.contains(event.target)) openLang(false);
  });

  document.addEventListener("keydown", function (event) {
    if (event.key === "Escape") {
      openLang(false);
      closeNav();
    }
  });

  /* --- mobil menü --- */
  function closeNav() {
    if (!nav || !burger) return;
    nav.classList.remove("is-open");
    burger.setAttribute("aria-expanded", "false");
  }

  if (burger) {
    burger.addEventListener("click", function () {
      var open = !nav.classList.contains("is-open");
      nav.classList.toggle("is-open", open);
      burger.setAttribute("aria-expanded", open ? "true" : "false");
    });
  }

  if (nav) {
    nav.addEventListener("click", function (event) {
      if (event.target.closest("a")) closeNav();
    });
  }

  /* --- kaydırma durumu --- */
  function onScroll() {
    if (!header) return;
    header.classList.toggle("is-scrolled", window.scrollY > 8);
  }
  window.addEventListener("scroll", onScroll, { passive: true });
  onScroll();

  /* --- görünürlük animasyonu --- */
  var revealItems = document.querySelectorAll("[data-reveal]");
  if ("IntersectionObserver" in window) {
    var observer = new IntersectionObserver(function (entries) {
      entries.forEach(function (entry) {
        if (entry.isIntersecting) {
          entry.target.classList.add("is-in");
          observer.unobserve(entry.target);
        }
      });
    }, { rootMargin: "0px 0px -8% 0px", threshold: 0.08 });

    for (var r = 0; r < revealItems.length; r++) {
      revealItems[r].classList.add("will-reveal");
      observer.observe(revealItems[r]);
    }
  } else {
    for (var s = 0; s < revealItems.length; s++) revealItems[s].classList.add("is-in");
  }

  /* --- SSS: aynı anda tek soru açık kalsın --- */
  var faqItems = document.querySelectorAll(".faq__item");
  for (var f = 0; f < faqItems.length; f++) {
    faqItems[f].addEventListener("toggle", function () {
      if (!this.open) return;
      for (var k = 0; k < faqItems.length; k++) {
        if (faqItems[k] !== this) faqItems[k].open = false;
      }
    });
  }

  /* --- başlangıç dili --- */
  var initial = storedLang() || DEFAULT_LANG;
  setLang(initial, false);
  if (!storedLang()) {
    var detected = browserLang();
    if (detected && detected !== DEFAULT_LANG) setLang(detected, false);
  }
})();
